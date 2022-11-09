// NewsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///  Экран новостей
final class NewsViewController: UIViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let newsCellIdentifier = "newsCell"
    }

    // MARK: - Private IBOutlet

    @IBOutlet private var newsTableView: UITableView! {
        didSet {
            newsTableView.dataSource = self
        }
    }

    // MARK: - Private Property

    private let news = NewsPosts.getNews()
}

// MARK: - UITableViewDataSource

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        news.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.newsCellIdentifier,
            for: indexPath
        ) as? NewsViewCell
        else { return UITableViewCell() }
        cell.setupUI(news: news[indexPath.row])
        return cell
    }
}
