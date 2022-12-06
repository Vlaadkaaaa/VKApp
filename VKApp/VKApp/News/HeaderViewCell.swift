// HeaderViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///
final class HeaderViewCell: UITableViewCell, NewsConfigurable {
    @IBOutlet private var authorImageView: UIImageView! {
        didSet {
            authorImageView.layer.cornerRadius = authorImageView.frame.height / 2
        }
    }

    @IBOutlet private var authorLabel: UILabel!

    @IBOutlet private var dateLabel: UILabel!

    // MARK: - Public Methods

    func configure(news: NewsBase) {
        authorImageView.image = UIImage(named: news.avatarImageName)
        authorLabel.text = news.name
        dateLabel.text = news.date
    }
}
