// PhotoViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с фото поста
final class PhotoViewCell: UITableViewCell, NewsConfigurable {
    // MARK: - Private IBOutlet

    @IBOutlet private var postImageView: UIImageView!

    // MARK: - Public Methods

    func configure(news: NewsResponseItem) {}
    func configure(news: NewsResponseItem, photoService: PhotoService) {
        guard let photoItem = news.attachments?.first?.photo,
              let photoUrl = photoItem.sizes.last?.url
        else { return }
        postImageView.image = photoService.photo(url: photoUrl)
    }
}
