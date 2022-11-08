// NewsViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///  Настройка ячейки новостей
final class NewsViewCell: UITableViewCell {
    // MARK: - Private IBOutlet

    @IBOutlet private var avatarImageView: UIImageView!
    @IBOutlet private var userNameLabel: UILabel!
    @IBOutlet private var postDateLabel: UILabel!
    @IBOutlet private var postDescriptionLabel: UILabel!
    @IBOutlet private var postImageView: UIImageView!

    // MARK: - Public Methods

    func setupUI(news: News) {
        avatarImageView.image = UIImage(named: news.avatarImageName)
        userNameLabel.text = news.name
        postDateLabel.text = news.date
        postDescriptionLabel.text = news.description
        postImageView.image = UIImage(named: news.postImageName ?? "")
    }
}
