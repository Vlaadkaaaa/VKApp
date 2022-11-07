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

    // MARK: - Private property

    private let friends = [
        Friend(name: Constants.oneNameText, imageName: Constants.onePeopleImageName),
        Friend(name: Constants.twoNameText, imageName: Constants.twoPeopleImageName),
        Friend(name: Constants.threeNameText, imageName: Constants.threePeopleImageName),
        Friend(name: Constants.fourNameText, imageName: Constants.fourPeopleImageName),
        Friend(name: Constants.fiveNameText, imageName: Constants.fivePeopleImageName),
        Friend(name: Constants.sixNameText, imageName: Constants.sixPeopleImageName),
        Friend(name: Constants.sevenNameText, imageName: Constants.sevenPeopleImageName),
        Friend(name: Constants.eightNameText, imageName: Constants.eightPeopleImageName),
        Friend(name: Constants.nineNameText, imageName: Constants.ninePeopleImageName),
        Friend(name: Constants.tenNameText, imageName: Constants.tenPeopleImageName),
        Friend(name: Constants.elevenNameText, imageName: Constants.elevenPeopleImageName),
        Friend(name: Constants.twelveNameText, imageName: Constants.twelvePeopleImageName),
        Friend(name: Constants.thirteenNameText, imageName: Constants.thirteenPeopleImageName),
        Friend(name: Constants.fourteenNameText, imageName: Constants.fourteenPeopleImageName),
        Friend(name: Constants.fiveteenNameText, imageName: Constants.fiveteenPeopleImageName),
        Friend(name: Constants.sixteenNameText, imageName: Constants.sixteenPeopleImageName),
        Friend(name: Constants.seventeenNameText, imageName: Constants.seventeenPeopleImageName),
        Friend(name: Constants.eightteenNameText, imageName: Constants.eighttennPeopleImageName),
        Friend(name: Constants.nineteenNameText, imageName: Constants.nineteenPeopleImageName)
    ]

    private var friendDetail: Friend?
}

// MARK: - UITableViewDataSource

extension FriendsTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.friendCellIdentifier,
            for: indexPath
        ) as? FriendViewCell
        else { return UITableViewCell() }
        let friend = friends[indexPath.row]
        cell.setupUI(friend)
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == Constants.friendDetailSegueIdentifier,
            let vc = segue.destination as? FriendDetailCollectionViewController,
            let index = tableView.indexPathForSelectedRow?.row
        else { return }
        vc.friend = friends[index]
    }
}
