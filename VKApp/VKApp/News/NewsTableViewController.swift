// NewsTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

typealias NewsCell = NewsConfigurable & UITableViewCell
/// NewsConfigurable
protocol NewsConfigurable {
    func configure(news: NewsResponseItem)
}

/// Показ полного текста новостей
protocol PostNewsTableCellDelegate: AnyObject {
    func didTappedTextButton(cell: PostViewCell)
}

///  Экран новостей
final class NewsTableViewController: UITableViewController, UITableViewDataSourcePrefetching {
    // MARK: - Private Constants

    private enum Constants {
        static let newsCellIdentifier = "newsCell"
        static let headerCellIdentifier = "HeaderCell"
        static let postCellIdentifier = "PostCell"
        static let photoCellIdentifier = "PhotoCell"
        static let footerCellIdentifier = "FooterCell"
        static let loadingText = "Loading..."
        static let countCellNumber = 3
    }

    // MARK: - Типы ячеек для NewsTableVC

    private enum NewsCellType: Int, CaseIterable {
        case header
        case photo
        case post
        case footer
    }

    // MARK: - Private Property

    private let networkService = NetworkService()
    private var news: NewsResponse?
    private var isLoading = false
    private var nextPage = ""

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPullToRefresh()
    }

    // MARK: - Private Methods

    private func fetchPosts(date: Double?) {
        networkService.fetchPosts { [weak self] result in
            guard let self else { return }
            switch result {
            case let .success(news):
                let news = news.response
                self.fetchNews(newsResponse: news)
                self.nextPage = news.nextPage
                self.refreshControl?.endRefreshing()
            case let .failure(error):
                self.tableView.showEmptyMessage(error.localizedDescription)
            }
        }
    }

    private func fetchNews(newsResponse: NewsResponse) {
        newsResponse.items.forEach { item in
            if item.sourceID < 0 {
                guard let group = newsResponse.groups.filter({ group in
                    group.id == item.sourceID * -1
                }).first else { return }
                item.authorName = group.name
                item.avatarPath = group.photo
            } else {
                guard let friend = newsResponse.profiles.filter({ friend in
                    friend.id == item.sourceID
                }).first else { return }
                item.authorName = "\(friend.firstName) \(friend.lastName)"
                item.avatarPath = friend.friendPhotoImageName ?? ""
            }
        }
        DispatchQueue.main.async {
            self.news = newsResponse
            self.tableView.reloadData()
        }
    }

    // MARK: - Pull to refresh

    private func setupPullToRefresh() {
        tableView.prefetchDataSource = self
        let color = UIColor.red
        refreshControl = UIRefreshControl()
        refreshControl?.tintColor = color
        let attrs: [NSAttributedString.Key: Any] = [.foregroundColor: color]
        refreshControl?.attributedTitle = NSAttributedString(string: Constants.loadingText, attributes: attrs)
        refreshControl?.addTarget(self, action: #selector(refreshNewsAction), for: .valueChanged)
    }

    @objc private func refreshNewsAction() {
        var mostFreshDate: TimeInterval?
        if let firstItem = news?.items.first {
            mostFreshDate = firstItem.date + 1
        }
        fetchPosts(date: mostFreshDate)
    }

    // MARK: - UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        if news?.items == nil {
            tableView.showEmptyMessage("No news loaded")
        } else {
            tableView.hideEmptyMessage()
        }
        return news?.items.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NewsCellType.allCases.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = NewsCellType(rawValue: indexPath.row) ?? .post
        var cellIdentifier = ""
        switch cellType {
        case .header:
            cellIdentifier = Constants.headerCellIdentifier
        case .post:
            cellIdentifier = Constants.postCellIdentifier
        case .photo:
            cellIdentifier = Constants.photoCellIdentifier
        case .footer:
            cellIdentifier = Constants.footerCellIdentifier
        }
        guard let news = news?.items[indexPath.section],
              let cell = tableView
              .dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? NewsCell
        else { return UITableViewCell() }
        cell.configure(news: news)
        if let cell = cell as? PostViewCell {
            cell.delegate = self
        }

        return cell
    }

    // MARK: - UITableViewDataSourcePrefetching

    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        guard let maxRow = indexPaths.map(\.section).max(),
              let news = news?.items,
              maxRow > news.count - Constants.countCellNumber,
              isLoading == false
        else { return }
        isLoading = true

        networkService.fetchPosts(startFrom: nextPage) { [weak self] result in
            guard let self,
                  let news = self.news?.items
            else { return }
            let oldNewsCount = news.count
            let newSections = (oldNewsCount ..< (oldNewsCount + news.count)).map { $0 }
            switch result {
            case let .success(news):
                self.news?.items.append(contentsOf: news.response.items)
                self.tableView.insertSections(IndexSet(newSections), with: .automatic)
                self.isLoading = false
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - PostNewsTableCellDelegate

extension NewsTableViewController: PostNewsTableCellDelegate {
    func didTappedTextButton(cell: PostViewCell) {
        tableView.beginUpdates()
        cell.isTapped.toggle()
        tableView.endUpdates()
    }
}

// MARK: - UITableViewDelegate

extension NewsTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cellType = NewsCellType(rawValue: indexPath.row),
              cellType == .photo else { return UITableView.automaticDimension }
        let news = news?.items
        switch cellType {
        case .photo:
            let tableWidth = tableView.bounds.width
            let aspectRation = CGFloat(
                news?[indexPath.section].attachments?.first?.photo?.sizes.first?
                    .aspectRatio ?? Float(0)
            )
            let cellHeight = tableWidth * aspectRation
            return cellHeight
        default:
            return UITableView.automaticDimension
        }
    }
}
