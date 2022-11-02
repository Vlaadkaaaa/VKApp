// GroupsDetailTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///
final class GroupsDetailTableViewController: UITableViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let imageName = "people-1"
        static let groupTitleText = "Hello"
    }
}

// MARK: - UITableViewDataSource

extension GroupsDetailTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "groupsDetailCell",
            for: indexPath
        ) as? GroupsDetailViewCell
        else { fatalError() }
        cell.setupUI(Groups(name: Constants.groupTitleText, imageName: Constants.imageName))
        return cell
    }
}
