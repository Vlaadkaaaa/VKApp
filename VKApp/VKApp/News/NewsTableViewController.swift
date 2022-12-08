// NewsTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

typealias NewsCell = NewsConfigurable & UITableViewCell
/// NewsConfigurable
protocol NewsConfigurable {
    func configure(news: NewsResponseItem)
}

///  Экран новостей
final class NewsTableViewController: UITableViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let newsCellIdentifier = "newsCell"
        static let headerCellIdentifier = "HeaderCell"
        static let postCellIdentifier = "PostCell"
        static let photoCellIdentifier = "PhotoCell"
        static let footerCellIdentifier = "FooterCell"
    }

    // MARK: - Типы ячеек для NewsTableVC

    private enum NewsCellType: Int, CaseIterable {
        case header
        case content
        case footer
    }

    // MARK: - Private Property

    private let networkService = NetworkService()
    private var news: NewsResponse?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPosts()
    }

    // MARK: - Private Methods

    private func fetchPosts() {
        networkService.fetchPosts { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(news):
                let news = news.response
                self.fetchNews(newsResponse: news)
            case let .failure(error):
                print(error.localizedDescription)
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

    // MARK: - UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        news?.items.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NewsCellType.allCases.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = NewsCellType(rawValue: indexPath.row) ?? .content
        var cellIdentifier = ""
        switch cellType {
        case .header:
            cellIdentifier = Constants.headerCellIdentifier
        case .content:
            cellIdentifier = Constants.postCellIdentifier
        case .footer:
            cellIdentifier = Constants.footerCellIdentifier
        }
        guard let news = news?.items[indexPath.section],
              let cell = tableView
              .dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? NewsCell
        else { return UITableViewCell() }
        cell.configure(news: news)
        return cell
    }
}
