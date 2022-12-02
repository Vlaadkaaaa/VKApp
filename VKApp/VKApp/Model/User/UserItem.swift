// UserItem.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// UserItem
@objcMembers
final class UserItem: Object, Codable {
    // MARK: - Public Property

    /// id пользователя
    dynamic var id: Int
    /// имя пользователя
    dynamic var firstName: String
    /// фамилия пользователя
    dynamic var lastName: String
    /// путь, по которому хранится фото пользователя
    dynamic var friendPhotoImageName: String?

    // MARK: - Public Method

    override static func primaryKey() -> String? {
        "id"
    }

    // MARK: - CodingKeys Enum

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case friendPhotoImageName = "photo_100"
    }
}
