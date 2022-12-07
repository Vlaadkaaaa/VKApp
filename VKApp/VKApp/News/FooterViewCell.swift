// FooterViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Футер для поста
final class FooterViewCell: UITableViewCell, NewsConfigurable {
    // MARK: - Private IBOutlet

    @IBOutlet private var likesCountLabel: UILabel!
    @IBOutlet private var commentCountLabel: UILabel!
    @IBOutlet private var repostsCountLabel: UILabel!
    @IBOutlet private var viewsLabel: UILabel!

    // MARK: - Public Methods

    func configure(news: NewsResponseItem, networkService: NetworkService?) {
        likesCountLabel.text = "\(news.likes.count)"
        commentCountLabel.text = "\(news.comments.count)"
        repostsCountLabel.text = "\(news.reposts.count)"
        viewsLabel.text = "\(news.views.count)"
    }
}
