// NetworkService.swift
// Copyright © RoadMap. All rights reserved.

import Alamofire
import Foundation

/// Сетевой слой на Alamofire
struct NetworkService {
    // MARK: - Private Constants

    private enum Constants {
        static let baseURL = "https://api.vk.com/method/"
        static let acessToken = "?&access_token=\(Session.shared.token)"
        static let friendFields = "&fields=first_name"
        static let getFriendText = "friends.get"
        static let getUserPhotoText = "photos.getAll"
        static let getGroupsText = "groups.get"
        static let getSearchGroupText = "groups.search"
        static let searchQueryText = "&q="
        static let version = "&v=5.81"
    }

    // MARK: - Public Methods

    func fetchFriends() {
        let path = "\(Constants.getFriendText)\(Constants.acessToken)\(Constants.friendFields)\(Constants.version)"
        let url = "\(Constants.baseURL)\(path)"
        AF.request(url).responseJSON { response in
            guard let value = response.value else { return }
            print(value)
        }
    }

    func fetchUserPhotos() {
        let path =
            "\(Constants.getUserPhotoText)\(Constants.acessToken)\(Constants.friendFields)\(Constants.version)"
        let url = "\(Constants.baseURL)\(path)"
        AF.request(url).responseJSON { response in
            guard let value = response.value else { return }
            print(value)
        }
    }

    func fetchGroups() {
        let path = "\(Constants.getGroupsText)\(Constants.acessToken)\(Constants.friendFields)\(Constants.version)"
        let url = "\(Constants.baseURL)\(path)"
        AF.request(url).responseJSON { response in
            guard let value = response.value else { return }
            print(value)
        }
    }

    func fetchGroups(group: String) {
        let path =
            "\(Constants.getSearchGroupText)\(Constants.acessToken)" +
            "\(Constants.friendFields)\(Constants.searchQueryText)\(group)\(Constants.version)"
        let url = "\(Constants.baseURL)\(path)"
        AF.request(url).responseJSON { response in
            guard let value = response.value else { return }
            print(value)
        }
    }
}
