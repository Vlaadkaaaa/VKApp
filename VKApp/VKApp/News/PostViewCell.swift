// PostViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с текстом поста
final class PostViewCell: UITableViewCell, NewsConfigurable {
    // MARK: - Private IBOutlet

    @IBOutlet private var postLabel: UILabel!

    // MARK: - Public Methods

    func configure(news: NewsResponseItem) {
        postLabel.text = news.text
    }
}
