// FriendsTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import PromiseKit
import RealmSwift
import UIKit

/// Экран друзей
final class FriendsTableViewController: UITableViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let friendCellIdentifier = "friendCell"
        static let friendDetailSegueIdentifier = "friendDetailSegue"
        static let titleErrorText = "Ошибка загрузки из БД"
    }

    // MARK: - Private IBOutlet

    @IBOutlet private var searchBar: UISearchBar!

    // MARK: - Private property

    private let networkService = NetworkService()
    private let realmService = RealmService()
    private let promiseNetworkService = PromiseNetworkService()
    private var photoService: PhotoService?
    private var token: NotificationToken?
    private var friends: Results<UserItem>?
    private var allFriends: [UserItem] = []
    private var sections: [Character: [UserItem]] = [:]
    private var sectionTitles: [Character] = []

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        loadFriends()
        setupCellToSections()
    }

    // MARK: - Public Methods

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == Constants.friendDetailSegueIdentifier,
            let vc = segue.destination as? FriendDetailCollectionViewController,
            let index = tableView.indexPathForSelectedRow,
            let id = sections[sectionTitles[index.section]]?[index.row].id
        else { return }
        vc.friendId = id
    }

    // MARK: - Private Methods

    private func loadFriends() {
        photoService = PhotoService(container: self)
        realmService.fetchData { [weak self] result in
            guard let self = self else { return }
            self.friends = result
            self.token = self.friends?.observe { change in
                switch change {
                case .initial:
                    self.tableView.reloadData()
                case .update:
                    self.tableView.reloadData()
                case let .error(error):
                    self.showAlertError(title: Constants.titleErrorText, message: error.localizedDescription)
                }
            }
        }
        fetchFriends()
    }

    private func fetchFriends() {
        firstly {
            promiseNetworkService.fetchFriends()
        }.done { user in
            self.allFriends = user.response.items
            self.realmService.saveDataToRealm(user.response.items)
        }.catch { error in
            self.showAlertError(title: Constants.titleErrorText, message: error.localizedDescription)
        }
    }

    private func setupCellToSections() {
        friends?.forEach {
            guard let firstCharacter = $0.firstName.first else { return }
            if sections[firstCharacter] != nil {
                sections[firstCharacter]?.append($0)
            } else {
                sections[firstCharacter] = [$0]
            }
        }
        sectionTitles = Array(sections.keys).sorted()
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension FriendsTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        sectionTitles.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[sectionTitles[section]]?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.friendCellIdentifier,
                for: indexPath
            ) as? FriendViewCell,
            let friend = sections[sectionTitles[indexPath.section]]?[indexPath.row],
            let photoSerivce = photoService
        else { return UITableViewCell() }
        cell.configurateCell(friend, photoService: photoSerivce)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension FriendsTableViewController {
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        sectionTitles.compactMap { String($0) }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "\(sectionTitles[section])"
    }
}
