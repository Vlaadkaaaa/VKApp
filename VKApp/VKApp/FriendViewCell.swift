// FriendViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Настройка ячейки друзей
final class FriendViewCell: UITableViewCell {
    // MARK: - IBOutlet

    @IBOutlet private var friendImageView: UIImageView! {
        didSet {
            friendImageView.layer.cornerRadius = 25
        }
    }

    @IBOutlet private var nameFriendLabel: UILabel!

    // MARK: - Public Methods

    func setupUI(_ friend: Friends) {
        nameFriendLabel.text = friend.name
        friendImageView.image = UIImage(named: friend.imageName)
    }
}
