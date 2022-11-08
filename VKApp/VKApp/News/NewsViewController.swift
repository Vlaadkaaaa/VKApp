// NewsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class NewsViewController: UIViewController {
    // MARK: - Private IBOutlet

    @IBOutlet private var newsTableView: UITableView!
    let news = [
        News(
            name: "Alex",
            date: "29.03.2323",
            postImageName: "logoVk",
            avatarImageName: "logoVk",
            description: "LogoVKLogoVKLogoVKLogoVKLogoVKLogoVKLogoVK" +
                "LogoVKLogoVKLogoVKLogoVKLogoVKLogoVKLogoVKLogoVKLogoVKLogoVKLogoVKLogoVK"
        ),
        News(
            name: "Vlad",
            date: "29.03.2323",
            postImageName: "logoVk",
            avatarImageName: "logoVk",
            description: "LogoVKLogoVKLogoVKLogoVKLogoVKLogoVKLogoVK"
        ),
        News(
            name: "Alex",
            date: "29.03.2323",
            postImageName: "logoVsk",
            avatarImageName: "logoVk",
            description: ""
        )
    ]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.dataSource = self
    }
}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as? NewsViewCell
        else { return UITableViewCell() }
        cell.setupUI(news: news[indexPath.row])
        return cell
    }
}
