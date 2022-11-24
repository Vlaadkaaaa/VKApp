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

    // MARK: - Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        setupGesture()
    }

    // MARK: - Public Methods

    func setupUI(_ group: GroupItem) {
        nameGroupLabel.text = group.name
        groupImageView.loadURL(group.photo100)
    }

    // MARK: - Private Methods

    private func setupGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureAction))
        groupImageView.addGestureRecognizer(gesture)
    }

    @objc private func tapGestureAction() {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1) {
            self.groupImageView.bounds = CGRect(
                x: self.groupImageView.center.x,
                y: self.groupImageView.center.y,
                width: 60,
                height: 60
            )
        }
    }
}
