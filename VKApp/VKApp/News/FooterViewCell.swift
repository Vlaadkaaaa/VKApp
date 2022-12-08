// FooterViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Футер для поста
final class FooterViewCell: UITableViewCell, NewsConfigurable {
    // MARK: - Private IBOutlet

    @IBOutlet private var likeCountLabel: UILabel!
    @IBOutlet private var commentCountLabel: UILabel!
    @IBOutlet private var repostCountLabel: UILabel!
    @IBOutlet private var viewLabel: UILabel!

    // MARK: - Public Methods

    func configure(news: NewsResponseItem) {
        likeCountLabel.text = "\(news.likes.count)"
        commentCountLabel.text = "\(news.comments.count)"
        repostCountLabel.text = "\(news.reposts.count)"
        viewLabel.text = "\(news.views.count)"
    }
}
