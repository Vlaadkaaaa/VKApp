// GroupsTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран групп пользователя
final class GroupsTableViewController: UITableViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let groupCellIdentifier = "groupCell"
        static let groupDetailSegueIdentifier = "groupDetailSegue"
        static let imageName = "people-1"
        static let oneGroupTitleText = "groupOne"
        static let twoImageName = "people-2"
        static let twoGrroupTitleText = "groupTwo"
        static let threeImageName = "people-3"
        static let threeGroupTitleText = "groupThree"
    }

    // MARK: - Private Property

    private var groups = [
        Groups(name: Constants.oneGroupTitleText, imageName: Constants.imageName),
        Groups(name: Constants.twoGrroupTitleText, imageName: Constants.twoImageName),
        Groups(name: Constants.threeGroupTitleText, imageName: Constants.threeImageName),
    ]

    // MARK: - Private IBACtion

    @IBAction private func addGroupAction(_ sender: UIStoryboardSegue) {
        guard let groupDetail = sender.source as? GroupsDetailTableViewController,
              let index = groupDetail.tableView.indexPathForSelectedRow
        else { return }
        groups.append(groupDetail.groups[index.row])
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension GroupsTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.groupCellIdentifier,
            for: indexPath
        ) as? GroupsViewCell
        else { fatalError() }
        let groups = groups[indexPath.row]
        cell.setupUI(groups)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension GroupsTableViewController {
    override func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
