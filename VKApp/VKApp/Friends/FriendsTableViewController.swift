// FriendsTableViewController.swift
// Copyright © RoadMap. All rights reserved.

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

    private var user: User?
    private var friends: [Item] = []
    private var sections: [Character: [Item]] = [:]
    private var sectionTitles: [Character] = []

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
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
        vc.friendIdebtifier = id
    }

    // MARK: - Private Methods

    private func fetchFriends() {
        NetworkService().fetchFriends { [weak self] user in
            self?.user = user
            self?.friends = user.response.items
            self?.setupCellToSections()
        }
    }

    private func setupCellToSections() {
        for friend in friends {
            guard let firstCharacter = friend.firstName.first else { return }
            if sections[firstCharacter] != nil {
                sections[firstCharacter]?.append(friend)
            } else {
                sections[firstCharacter] = [friend]
            }
            sectionTitles = Array(sections.keys).sorted()
            tableView.reloadData()
        }
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
        String(sectionTitles[section])
    }
}
