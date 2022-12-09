// GroupResponse.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Ответ сервера для группы
struct GroupResponse: Decodable {
    /// Количество групп
    let count: Int
    /// Список групп
    let items: [GroupItem]
}
