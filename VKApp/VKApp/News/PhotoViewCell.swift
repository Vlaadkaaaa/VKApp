// PhotoViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с фото поста
final class PhotoViewCell: UITableViewCell, NewsConfigurable {
    // MARK: - Private IBOutlet

    @IBOutlet private var postImageView: UIImageView!

    // MARK: - Private Property

    private var networkService = NetworkService()

    // MARK: - Public Methods

    func configure(news: NewsResponseItem) {
        guard let photoItem = news.attachments?.first?.photo,
              let photoUrl = photoItem.sizes.last?.url
        else { return }
        postImageView.loadImage(photoUrl, networkService: networkService)
    }
}
