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

    // MARK: - Private IBOutlet

    @IBOutlet private var searchBar: UISearchBar!

    // MARK: - Public property

    let groups = [
        Group(name: Constants.fiveGroupTitleText, imageName: Constants.fiveGroupImageName),
        Group(name: Constants.sixGroupTitleText, imageName: Constants.sixGroupImageName),
        Group(name: Constants.sevenGroupTitleText, imageName: Constants.sevenGroupImageName)
    ]

    // MARK: - Private Property

    private var filterGroup: [Group] = []

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureFilther()
    }

    // MARK: - Private Methods

    private func configureFilther() {
        filterGroup = groups
        searchBar.delegate = self
    }
}

// MARK: - UITableViewDataSource

extension GroupsDetailTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filterGroup.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.groupsDetailCellIdentifier,
            for: indexPath
        ) as? GroupsDetailViewCell
        else { return UITableViewCell() }
        cell.setupUI(filterGroup[indexPath.row])
        return cell
    }
}

// MARK: - UISearchBarDelegate

extension GroupsDetailTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterGroup = []
        if searchText.isEmpty {
            filterGroup = groups
        } else {
            for group in groups where group.name.lowercased().contains(searchText.lowercased()) {
                filterGroup.append(group)
            }
        }
        tableView.reloadData()
    }
}
