// PhotoViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с фото поста
final class PhotoViewCell: UITableViewCell, NewsConfigurable {
    // MARK: - Private IBOutlet

    @IBOutlet private var postImageView: UIImageView!

    // MARK: - Public Methods

    func configure(news: NewsResponseItem) {}
}
