// GroupItem.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// GroupItem

final class GroupItem: Object, Codable {
    // MARK: - Public Property

    /// id пользователя
    @Persisted var id: Int
    /// имя пользователя
    @Persisted var name: String
    /// путь, по которому хранится фото пользователя
    @Persisted var photo: String

    // MARK: - Public Method

    override static func primaryKey() -> String? {
        "id"
    }

    // MARK: - CodingKeys Enum

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photo = "photo_100"
    }
}
