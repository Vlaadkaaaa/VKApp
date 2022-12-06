// NewsTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///  Экран новостей
final class NewsTableViewController: UITableViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let newsCellIdentifier = "newsCell"
    }

    private enum NewsCellType: Int {
        case header
        case content
        case footer
    }

    // MARK: - Private Property

    private let networkService = NetworkService()

    override func viewDidLoad() {
        super.viewDidLoad()
        networkService.fetchPosts { result in
            switch result {
            case let .success(welcome):
                print(welcome.response.items)
            case let .failure(error):
                print(error)
            }
        }
    }

    private func contentCellIdentifier(_ item: NewsItemType) -> String {
        switch item {
        case .post:
            return "PostCell"
        case .image:
            return "PhotoCell"
        }
    }

    // MARK: - Private Property

    private let news = NewsPosts.getNews()

    // MARK: - UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        news.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = news[indexPath.section]
        let cellType = NewsCellType(rawValue: indexPath.row) ?? .content
        var cellIdentifier = ""
        switch cellType {
        case .header:
            cellIdentifier = "HeaderCell"
        case .content:
            cellIdentifier = contentCellIdentifier(item.type)
        case .footer:
            cellIdentifier = "FooterCell"
        }
        guard let cell = tableView
            .dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? NewsCell
        else { return UITableViewCell() }
        cell.configure(news: item)
        return cell
    }
}
