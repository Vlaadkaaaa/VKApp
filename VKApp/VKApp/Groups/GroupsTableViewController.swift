// GroupsTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift
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
        static let titleErrorText = "Ошибка загрузки из БД"
    }

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        fetchGroups()
    }

    // MARK: - Private Property

    private let networkService = NetworkService()
    private let realmService = RealmService()
    private var groupsResponse: Group?
    private var groups: [GroupItem] = []

    // MARK: - Private Methods

    private func fetchGroups() {
        NetworkService().fetchGroups { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(group):
                let groups = group.response.items
                self.realmService.saveDataToRealm(groups)
            case let .failure(error):
                self.showAlertError(title: Constants.titleErrorText, message: error.localizedDescription)
            }
            self.loadData()
            self.tableView.reloadData()
        }
    }

    private func loadData() {
        guard let objects = realmService.loadData(GroupItem.self) else { return }
        groups = Array(objects)
    }

    // MARK: - Private IBAction

    @IBAction private func addGroupAction(_ sender: UIStoryboardSegue) {
        guard let groupDetail = sender.source as? GroupsDetailTableViewController,
              let index = groupDetail.tableView.indexPathForSelectedRow
        else { return }
        groups.append(groupDetail.groupItems[index.row])
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
        else { return UITableViewCell() }
        let group = groups[indexPath.row]
        cell.setupUI(group, networkService: networkService)
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
            tableView.beginUpdates()
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
}
