// PromiseNetworkService.swift
// Copyright © RoadMap. All rights reserved.

import Alamofire
import PromiseKit

/// Сетевой слой с использованеим PromiseKit
final class PromiseNetworkService {
    // MARK: - Constants

    private enum Constants {
        static let baseURL = "https://api.vk.com/method/"
        static let acessToken = "?&access_token=\(Session.shared.token)"
        static let friendFields = "&fields=photo_100"
        static let getFriendText = "friends.get"
        static let version = "&v=5.81"
    }

    // MARK: - Public Methods

    func fetchFriends(completion: @escaping (Result<User>) -> Void) {
        let path = "\(Constants.getFriendText)\(Constants.acessToken)\(Constants.friendFields)\(Constants.version)"
        let url = "\(Constants.baseURL)\(path)"
        AF.request(url).responseData { response in
            guard let data = response.data else { return }
            do {
                let userResponse = try JSONDecoder().decode(User.self, from: data)
                completion(.fulfilled(userResponse))
            } catch {
                completion(.rejected(error))
            }
        }
    }

    func fetchFriends() -> Promise<User> {
        let path = "\(Constants.getFriendText)\(Constants.acessToken)\(Constants.friendFields)\(Constants.version)"
        let url = "\(Constants.baseURL)\(path)"
        var user: User?
        var errorText: Error?

        AF.request(url).responseData { response in
            guard let data = response.data else { return }
            do {
                let userResponse = try JSONDecoder().decode(User.self, from: data)
                user = userResponse
            } catch {
                errorText = error
            }
        }
        return Promise<User> { resolver in
            if let user {
                resolver.fulfill(user)
            } else if let errorText {
                resolver.reject(errorText)
            }
        }
    }
}
