// User.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

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
struct UserItem: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let friendPhotoImageName: String?

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case friendPhotoImageName = "photo_100"
    }
}
