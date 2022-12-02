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

    @IBOutlet private var searchBar: UISearchBar! {
        didSet {
            searchBar.delegate = self
        }
    }

    // MARK: - Private Property

    let networkService = NetworkService()
    var groupItems: [GroupItem] = []
}

// MARK: - UITableViewDataSource

extension GroupsDetailTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groupItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.groupsDetailCellIdentifier,
            for: indexPath
        ) as? GroupsDetailViewCell
        else { return UITableViewCell() }
        DispatchQueue.main.async {
            cell.setupUI(self.groupItems[indexPath.row], networkService: self.networkService)
        }
        return cell
    }
}

// MARK: - UISearchBarDelegate

extension GroupsDetailTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NetworkService().fetchGroups(group: searchBar.text ?? "") { [weak self] result in
            switch result {
            case let .success(group):
                self?.groupItems = group.response.items
            case let .failure(error):
                print(error)
            }
        }
        tableView.reloadData()
    }
}
