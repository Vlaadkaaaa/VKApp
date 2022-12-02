// GroupsDetailViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///  Настройкс ячейки таблицы экрана всех групп
final class GroupsDetailViewCell: UITableViewCell {
    // MARK: - IBOutlet

    @IBOutlet private var groupsDetailImageView: UIImageView!
    @IBOutlet private var groupsNameLabel: UILabel!

    // MARK: - Public Methods

    func setupUI(_ group: GroupItem?, networkService: NetworkService) {
        groupsNameLabel.text = group?.name
        groupsDetailImageView.loadImage(group?.photo ?? "", networkService: networkService)
    }
}
