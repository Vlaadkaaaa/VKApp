// FriendsTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран друзей
final class FriendsTableViewController: UITableViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let friendCellIdentifier = "friendCell"
        static let oneNameText = "Liana Anderson"
        static let twoNameText = "Callie Spencer"
        static let threeNameText = "Arely Jacobs"
        static let fourNameText = "Paige Poole"
        static let fiveNameText = "Khloe Dominguez"
        static let sixNameText = "Asia Simon"
        static let sevenNameText = "Mitchell Salas"
        static let eightNameText = "Nicholas Ferrell"
        static let nineNameText = "Carson Gonzalez"
        static let tenNameText = "Andres Randolph"
        static let elevenNameText = "Tyrese Dominguez"
        static let twelveNameText = "Atticus Barnes"
        static let thirteenNameText = "Aliana Ellis"
        static let fourteenNameText = "Kaeden Espinoza"
        static let fiveteenNameText = "Lauryn Macias"
        static let sixteenNameText = "Muhammad Guerrero"
        static let seventeenNameText = "Yasmine Donaldson"
        static let eightteenNameText = "Yair Ruiz"
        static let nineteenNameText = "Maliyah Golden"
        static let onePeopleImageName = "people-1"
        static let twoPeopleImageName = "people-2"
        static let threePeopleImageName = "people-3"
        static let fourPeopleImageName = "people-4"
        static let fivePeopleImageName = "people-5"
        static let sixPeopleImageName = "people-6"
        static let sevenPeopleImageName = "people-7"
        static let eightPeopleImageName = "people-8"
        static let ninePeopleImageName = "people-9"
        static let tenPeopleImageName = "people-10"
        static let elevenPeopleImageName = "people-11"
        static let twelvePeopleImageName = "people-12"
        static let thirteenPeopleImageName = "people-13"
        static let fourteenPeopleImageName = "people-14"
        static let fiveteenPeopleImageName = "people-15"
        static let sixteenPeopleImageName = "people-16"
        static let seventeenPeopleImageName = "people-17"
        static let eighttennPeopleImageName = "people-18"
        static let nineteenPeopleImageName = "people-19"
        static let friendDetailSegueIdentifier = "friendDetailSegue"
    }

    // MARK: - Private IBOutlet

    @IBOutlet private var searchBar: UISearchBar!

    // MARK: - Private property

    private let friends = Friends.getFriends()
    private var sections: [Character: [Friend]] = [:]
    private var sectionTitles: [Character] = []
    private var filteredFriend: [Character: [Friend]] = [:]

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureFilther()
    }

    // MARK: - Public Methods

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == Constants.friendDetailSegueIdentifier,
            let vc = segue.destination as? FriendDetailCollectionViewController,
            let index = tableView.indexPathForSelectedRow?.row
        else { return }
        vc.friend = friends[index]
    }

    // MARK: - Private Methods

    private func configureFilther() {
        setupCellToSection()
        filteredFriend = sections
        searchBar.delegate = self
    }

    private func setupCellToSection() {
        for friend in friends {
            guard let firstCharacter = friend.name.first else { return }
            if sections[firstCharacter] != nil {
                sections[firstCharacter]?.append(friend)
            } else {
                sections[firstCharacter] = [friend]
            }
        }
        sectionTitles = Array(sections.keys).sorted()
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension FriendsTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        filteredFriend.keys.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredFriend[sectionTitles[section]]?.count ?? 0
    }

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        sectionTitles.compactMap { String($0) }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        String(sectionTitles[section])
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.friendCellIdentifier,
                for: indexPath
            ) as? FriendViewCell,
            let friend = filteredFriend[sectionTitles[indexPath.section]]?[indexPath.row]

        else { return UITableViewCell() }

        cell.setupUI(friend)
        return cell
    }
}

// MARK: - UISearchBarDelegate

extension FriendsTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredFriend = sections
        } else if let first = searchText.first, var friendKey = filteredFriend[first] {
            friendKey = friendKey.filter { friend in
                friend.name.contains(searchText)
            }
            filteredFriend = [:]
            filteredFriend[first] = friendKey
        }
        tableView.reloadData()
    }
}
