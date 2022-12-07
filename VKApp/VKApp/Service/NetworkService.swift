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
        static let getPostText = "newsfeed.get"
        static let getGroupsText = "groups.get"
        static let getSearchGroupText = "groups.search"
        static let filtersPostText = "&filters=post"
        static let searchQueryText = "&q="
        static let ownerIdText = "&owner_id="
        static let extendedText = "&extended=1"
        static let version = "&v=5.81"
    }

    // MARK: - Public Methods

    func fetchFriends(completion: @escaping (Result<User, Error>) -> Void) {
        let path = "\(Constants.getFriendText)\(Constants.acessToken)\(Constants.friendFields)\(Constants.version)"
        let url = "\(Constants.baseURL)\(path)"
        AF.request(url).responseData { response in
            guard let data = response.data else { return }
            do {
                let userResponse = try JSONDecoder().decode(User.self, from: data)
                completion(.success(userResponse))
            } catch {
                completion(.failure(error))
            }
        }
    }

    func fetchUserPhotos(ownerId: Int, completion: @escaping (Result<Photo, Error>) -> Void) {
        let path =
            "\(Constants.getUserPhotoText)\(Constants.acessToken)" +
            "\(Constants.friendFields)\(Constants.ownerIdText)\(ownerId)\(Constants.version)"
        let url = "\(Constants.baseURL)\(path)"
        AF.request(url).responseData { response in
            guard let data = response.data else { return }
            do {
                let photoResponse = try JSONDecoder().decode(Photo.self, from: data)
                completion(.success(photoResponse))
            } catch {
                completion(.failure(error))
            }
        }
    }

    func fetchGroups(completion: @escaping (Result<Group, Error>) -> Void) {
        let path =
            "\(Constants.getGroupsText)\(Constants.acessToken)\(Constants.friendFields)" +
            "\(Constants.extendedText)\(Constants.version)"
        let url = "\(Constants.baseURL)\(path)"
        AF.request(url).responseData { response in
            guard let data = response.data else { return }
            do {
                let groupResponse = try JSONDecoder().decode(Group.self, from: data)
                completion(.success(groupResponse))
            } catch {
                completion(.failure(error))
            }
        }
    }

    func fetchGroups(group: String, completion: @escaping (Result<Group, Error>) -> Void) {
        let path =
            "\(Constants.getSearchGroupText)\(Constants.acessToken)" +
            "\(Constants.friendFields)\(Constants.searchQueryText)\(group)\(Constants.version)"
        let url = "\(Constants.baseURL)\(path)"
        AF.request(url).responseData { response in
            guard let data = response.data else { return }
            do {
                let groupResponse = try JSONDecoder().decode(Group.self, from: data)
                completion(.success(groupResponse))
            } catch {
                completion(.failure(error))
            }
        }
    }

    func fetchPosts(completion: @escaping (Result<News, Error>) -> ()) {
        let path = "\(Constants.getPostText)\(Constants.acessToken)\(Constants.version)\(Constants.filtersPostText)"
        let url = "\(Constants.baseURL)\(path)"
        AF.request(url).responseData { response in
            guard let data = response.data else { return }
            do {
                let postResponse = try JSONDecoder().decode(News.self, from: data)
                completion(.success(postResponse))
            } catch {
                completion(.failure(error))
            }
        }
    }

    func loadImageData(_ url: String, completion: @escaping (Data) -> Void) {
        DispatchQueue.global().async {
            guard let url = URL(string: url),
                  let data = try? Data(contentsOf: url)
            else { return }
            completion(data)
        }
    }

    // MARK: - Private Methods

    private func fetchData<T: Decodable>(path: String, completion: @escaping (Result<T, Error>) -> Void) {
        let url = "\(Constants.baseURL)\(path)"
        AF.request(url).responseData { response in
            guard let data = response.data else { return }
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
