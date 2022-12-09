// UserItem.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Информация о пользователе

final class UserItem: Object, Codable {
    // MARK: - Public Property

    /// ID пользователя
    @Persisted var id: Int
    /// Имя пользователя
    @Persisted var firstName: String
    /// Фамилия пользователя
    @Persisted var lastName: String
    /// Путь, по которому хранится фото пользователя
    @Persisted var friendPhotoImageName: String?

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
