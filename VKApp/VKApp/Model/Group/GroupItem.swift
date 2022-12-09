// GroupItem.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Информация о группе

final class GroupItem: Object, Codable {
    // MARK: - Public Property

    /// ID пользователя
    @Persisted var id: Int
    /// Имя пользователя
    @Persisted var name: String
    /// Путь, по которому хранится фото пользователя
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
