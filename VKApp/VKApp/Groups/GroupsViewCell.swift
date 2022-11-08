// GroupsViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Настройка ячейки экрана групп пользователя
final class GroupsViewCell: UITableViewCell {
    // MARK: - Private IBOutlet

    @IBOutlet private var nameGroupLabel: UILabel!

    @IBOutlet private var groupImageView: UIImageView! {
        didSet {
            groupImageView.isUserInteractionEnabled = true
        }
    }

    // MARK: - Public Methods

    func setupUI(_ group: Group) {
        nameGroupLabel.text = group.name
        groupImageView.image = UIImage(named: group.imageName)
    }
}
