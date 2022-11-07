// FriendDetailViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Показ фото пользователя
final class FriendDetailViewCell: UICollectionViewCell {
    // MARK: - Private IBOutlet

    @IBOutlet private var friendImageView: UIImageView!

    // MARK: - Public Methods

    func setupUI(_ friend: Friend) {
        friendImageView.image = UIImage(named: friend.imageName)
    }
}
