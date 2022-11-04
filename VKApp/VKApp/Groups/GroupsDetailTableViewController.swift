// GroupsDetailTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///  Экран всех доступных групп
final class GroupsDetailTableViewController: UITableViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let fiveGroupImageName = "people-5"
        static let fiveGroupTitleText = "Group 5"
        static let sixGroupImageName = "people-6"
        static let sixGroupTitleText = "Group 6"
        static let sevenGroupImageName = "people-7"
        static let sevenGroupTitleText = "Group 7"
        static let groupsDetailCellIdentifier = "groupsDetailCell"
    }

    // MARK: - Public property

    let groups = [
        Groups(name: Constants.fiveGroupTitleText, imageName: Constants.fiveGroupImageName),
        Groups(name: Constants.sixGroupTitleText, imageName: Constants.sixGroupImageName),
        Groups(name: Constants.sevenGroupTitleText, imageName: Constants.sevenGroupImageName)
    ]
}

// MARK: - UITableViewDataSource

extension GroupsDetailTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.groupsDetailCellIdentifier,
            for: indexPath
        ) as? GroupsDetailViewCell
        else { fatalError() }
        cell.setupUI(groups[indexPath.row])
        return cell
    }
}
