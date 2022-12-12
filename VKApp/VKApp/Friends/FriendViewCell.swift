// FriendViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Настройка ячейки друзей
final class FriendViewCell: UITableViewCell {
    // MARK: - IBOutlet

    @IBOutlet private var friendImageView: FriendAvatarView!
    @IBOutlet private var nameFriendLabel: UILabel!

    // MARK: - Public Methods

    func configurateCell(_ friend: UserItem, image: UIImage) {
        nameFriendLabel.text = "\(friend.firstName) \(friend.lastName)"
        friendImageView.setupAvatarImage(image)
    }
}
