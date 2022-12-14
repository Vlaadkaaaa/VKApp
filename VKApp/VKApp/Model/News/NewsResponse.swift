// NewsResponse.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Список новостей
struct NewsResponse: Decodable {
    /// Новости
    var items: [NewsResponseItem]
    /// Друзья
    var profiles: [UserItem]
    /// Группы
    var groups: [GroupItem]
    /// Следующая страница новостей
    var nextPage: String

    private enum CodingKeys: String, CodingKey {
        case items
        case profiles
        case groups
        case nextPage = "next_from"
    }
}
