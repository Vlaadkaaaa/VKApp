// GroupsDetailViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///
final class GroupsDetailViewCell: UITableViewCell {
    // MARK: - IBOutlet

    @IBOutlet private var groupsDetailImageView: UIImageView!
    @IBOutlet private var groupsNameLabel: UILabel!

    // MARK: - Public Methods

    func setupUI(_ group: Groups) {
        groupsNameLabel.text = group.name
        groupsDetailImageView.image = UIImage(named: group.imageName)
    }
}
