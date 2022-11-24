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
        static let friendFields = "&fields=photo_100"
        static let getFriendText = "friends.get"
        static let getUserPhotoText = "photos.getAll"
        static let getGroupsText = "groups.get"
        static let getSearchGroupText = "groups.search"
        static let searchQueryText = "&q="
        static let ownerIdText = "&owner_id="
        static let extendedText = "&extended=1"
        static let version = "&v=5.81"
    }

    // MARK: - Public Methods

    func fetchFriends(completion: @escaping (User) -> Void) {
        let path = "\(Constants.getFriendText)\(Constants.acessToken)\(Constants.friendFields)\(Constants.version)"
        let url = "\(Constants.baseURL)\(path)"
        AF.request(url).responseData { response in
            guard let data = response.data else { return }
            do {
                let userResponse = try JSONDecoder().decode(User.self, from: data)
                completion(userResponse)
            } catch {
                print(error)
            }
        }
    }

    func fetchUserPhotos(ownerId: Int, completion: @escaping (Photo) -> Void) {
        let path =
            "\(Constants.getUserPhotoText)\(Constants.acessToken)" +
            "\(Constants.friendFields)\(Constants.ownerIdText)\(ownerId)\(Constants.version)"
        let url = "\(Constants.baseURL)\(path)"
        AF.request(url).responseData { response in
            guard let data = response.data else { return }
            do {
                let photoResponse = try JSONDecoder().decode(Photo.self, from: data)
                completion(photoResponse)
            } catch {
                print(error)
            }
        }
        print(url)
    }

    func fetchGroups(completion: @escaping (GroupWelcome) -> Void) {
        let path =
            "\(Constants.getGroupsText)\(Constants.acessToken)\(Constants.friendFields)" +
            "\(Constants.extendedText)\(Constants.version)"
        let url = "\(Constants.baseURL)\(path)"
        AF.request(url).responseData { response in
            guard let data = response.data else { return }
            do {
                let groupResponse = try JSONDecoder().decode(GroupWelcome.self, from: data)
                completion(groupResponse)
            } catch {
                print(error)
            }
        }
        print(url)
    }

    func fetchGroups(group: String) {
        let path =
            "\(Constants.getSearchGroupText)\(Constants.acessToken)" +
            "\(Constants.friendFields)\(Constants.searchQueryText)\(group)\(Constants.version)"
        sendRequest(path: path)
    }

    // MARK: - Private Methods

    private func sendRequest(path: String) {
        let url = "\(Constants.baseURL)\(path)"

        AF.request(url).responseJSON { response in
            guard let value = response.value else { return }
            print(url)
        }
    }
}
