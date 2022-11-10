// FriendViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Настройка ячейки друзей
final class FriendViewCell: UITableViewCell {
    // MARK: - IBOutlet

    @IBOutlet private var friendImageView: FriendAvatarView!
    @IBOutlet private var nameFriendLabel: UILabel!

    // MARK: - Public Methods

    func setupUI(_ friend: FriendKey, index: Int) {
        nameFriendLabel.text = friend.dictionary[index]?.name
        friendImageView.setupAvatarImage(friend.dictionary[index]?.imageName ?? "")
    }
}
