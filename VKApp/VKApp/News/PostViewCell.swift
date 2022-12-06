// PostViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///
final class PostViewCell: UITableViewCell, NewsConfigurable {
    @IBOutlet private var postLabel: UILabel!

    // MARK: - Public Methods

    func configure(news: NewsBase) {
        postLabel.text = news.description
    }
}
