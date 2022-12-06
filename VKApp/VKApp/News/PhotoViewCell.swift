// PhotoViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///  Настройка ячейки новостей
final class PhotoViewCell: UITableViewCell, NewsConfigurable {
    // MARK: - Private IBOutlet

    @IBOutlet private var postImageView: UIImageView!

    // MARK: - Public Methods

    func configure(news: NewsBase) {
        postImageView.image = UIImage(named: news.postImageName ?? "")
    }
}
