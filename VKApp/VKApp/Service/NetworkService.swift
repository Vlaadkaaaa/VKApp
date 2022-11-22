// NetworkService.swift
// Copyright © RoadMap. All rights reserved.

import Alamofire
import Foundation

/// NetworkService
struct NetworkService {
    // MARK: - Private Constants

    private enum Constants {
        static let baseURL = "https://api.vk.com/method/"
        static let acessToken = "?&access_token=\(Session.shared.token)"
        static let friendFields = "&fields=first_name"
        static let getFriendRequest = "friends.get"
        static let getUserPhotoRequest = "photos.getAll"
        static let getGroupsRequest = "groups.get"
        static let getSearchGroupRequest = "groups.search"
        static let searchQueryText = "&q="
        static let version = "&v=5.81"
    }

    // MARK: - Public Methods

    func getFriends() {
        let path = "\(Constants.getFriendRequest)\(Constants.acessToken)\(Constants.friendFields)\(Constants.version)"
        let url = Constants.baseURL + path
        AF.request(url).responseJSON { response in
            guard let value = response.value else { return }
            print(value)
        }
    }

    func getUserPhotos() {
        let path =
            "\(Constants.getUserPhotoRequest)\(Constants.acessToken)\(Constants.friendFields)\(Constants.version)"
        let url = Constants.baseURL + path
        AF.request(url).responseJSON { response in
            guard let value = response.value else { return }
            print(value)
        }
    }

    func getGroups() {
        let path = "\(Constants.getGroupsRequest)\(Constants.acessToken)\(Constants.friendFields)\(Constants.version)"
        let url = Constants.baseURL + path
        AF.request(url).responseJSON { response in
            guard let value = response.value else { return }
            print(value)
        }
    }

    func getGroups(group: String) {
        let path =
            "\(Constants.getSearchGroupRequest)\(Constants.acessToken)" +
            "\(Constants.friendFields)\(Constants.searchQueryText)\(group)\(Constants.version)"
        let url = Constants.baseURL + path
        AF.request(url).responseJSON { response in
            guard let value = response.value else { return }
            print(value)
        }
    }
}
