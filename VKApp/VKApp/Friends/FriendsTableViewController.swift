// FriendsTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift
import UIKit

/// Экран друзей
final class FriendsTableViewController: UITableViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let friendCellIdentifier = "friendCell"
        static let friendDetailSegueIdentifier = "friendDetailSegue"
    }

    // MARK: - Private IBOutlet

    @IBOutlet private var searchBar: UISearchBar!

    // MARK: - Private property

    private var token: NotificationToken?
    private var friends: Results<UserItem>?
    private var sections: [Character: [UserItem]] = [:]
    private var sectionTitles: [Character] = []

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataFromRealm()
        fetchFriends()
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

    private func fetchFriends() {
        LocalService().fetchData { [weak self] result in
            self?.friends = result
            self?.token = self?.friends?.observe { change in
                switch change {
                case .initial:
                    break
                case .update:
                    self?.tableView.reloadData()
                case let .error(error):
                    print(error)
                }
            }
        }
        NetworkService().fetchFriends { [weak self] in
            guard let self = self else { return }
            self.loadDataFromRealm()
            self.tableView.reloadData()
        }
    }

    private func loadDataFromRealm() {
        do {
            let realm = try Realm()
            let objects = realm.objects(UserItem.self)
            friends = objects
            fetchFriends()
            setupCellToSections()
        } catch {
            print(error)
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
            let friend = sections[sectionTitles[indexPath.section]]?[indexPath.row]
        else { return UITableViewCell() }
        cell.configurateCell(friend)
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
