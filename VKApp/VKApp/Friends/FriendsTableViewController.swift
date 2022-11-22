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

    private var friends = Friends.friends
    private var sections: [Character: [Friend]] = [:]
    private var sectionTitles: [Character] = []

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCellToSections()
        NetworkService().getFriends()
    }

    // MARK: - Public Methods

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == Constants.friendDetailSegueIdentifier,
            let vc = segue.destination as? FriendDetailCollectionViewController,
            let index = tableView.indexPathForSelectedRow,
            let photos = sections[sectionTitles[index.section]]?[index.row].profileImagesName
        else { return }
        vc.friendPhotos = photos
    }

    // MARK: - Private Methods

    private func setupCellToSections() {
        for friend in friends {
            guard let firstCharacter = friend.name.first else { return }
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
