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
}
