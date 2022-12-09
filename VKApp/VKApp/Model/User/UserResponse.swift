// UserResponse.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Ответ сервера для друга
struct UserResponse: Codable {
    /// Количество друзей
    let count: Int
    /// Список друзей
    let items: [UserItem]
}
