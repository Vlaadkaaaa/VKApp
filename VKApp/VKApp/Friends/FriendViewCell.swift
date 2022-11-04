// FriendViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Настройка ячейки друзей
final class FriendViewCell: UITableViewCell {
    // MARK: - IBOutlet

    @IBOutlet private var friendImageView: FriendAvatarView!
    @IBOutlet private var nameFriendLabel: UILabel!

    // MARK: - Public Methods

    func setupUI(_ friend: Friends) {
        nameFriendLabel.text = friend.name
        friendImageView.setupAvatarImage(friend.imageName)
    }
}
