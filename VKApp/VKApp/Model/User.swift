// User.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift
/// User
struct User: Codable {
    let response: UserResponse
}

/// UserResponse
struct UserResponse: Codable {
    let count: Int
    let items: [UserItem]
}

/// UserItem
final class UserItem: Object, Codable {
    @objc dynamic var id: Int
    @objc dynamic var firstName: String
    @objc dynamic var lastName: String
    @objc dynamic var friendPhotoImageName: String?

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case friendPhotoImageName = "photo_100"
    }
}
