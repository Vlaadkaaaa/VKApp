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
        Friends(name: Constants.oneNameText, imageName: Constants.onePeopleImageName),
        Friends(name: Constants.twoNameText, imageName: Constants.twoPeopleImageName),
        Friends(name: Constants.threeNameText, imageName: Constants.threePeopleImageName),
        Friends(name: Constants.fourNameText, imageName: Constants.fourPeopleImageName),
        Friends(name: Constants.fiveNameText, imageName: Constants.fivePeopleImageName),
        Friends(name: Constants.sixNameText, imageName: Constants.sixPeopleImageName),
        Friends(name: Constants.sevenNameText, imageName: Constants.sevenPeopleImageName),
        Friends(name: Constants.eightNameText, imageName: Constants.eightPeopleImageName),
        Friends(name: Constants.nineNameText, imageName: Constants.ninePeopleImageName),
        Friends(name: Constants.tenNameText, imageName: Constants.tenPeopleImageName),
        Friends(name: Constants.elevenNameText, imageName: Constants.elevenPeopleImageName),
        Friends(name: Constants.twelveNameText, imageName: Constants.twelvePeopleImageName),
        Friends(name: Constants.thirteenNameText, imageName: Constants.thirteenPeopleImageName),
        Friends(name: Constants.fourteenNameText, imageName: Constants.fourteenPeopleImageName),
        Friends(name: Constants.fiveteenNameText, imageName: Constants.fiveteenPeopleImageName),
        Friends(name: Constants.sixteenNameText, imageName: Constants.sixteenPeopleImageName),
        Friends(name: Constants.seventeenNameText, imageName: Constants.seventeenPeopleImageName),
        Friends(name: Constants.eightteenNameText, imageName: Constants.eighttennPeopleImageName),
        Friends(name: Constants.nineteenNameText, imageName: Constants.nineteenPeopleImageName)
    ]

    private var friendDetail: Friends?
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
        else { fatalError() }
        let friend = friends[indexPath.row]
        cell.setupUI(friend)
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == Constants.friendDetailSegueIdentifier else { return }
        guard let vc = segue.destination as? FriendDetailCollectionViewController,
              let index = tableView.indexPathForSelectedRow?.row else { return }
        vc.friend = friends[index]
    }
}
