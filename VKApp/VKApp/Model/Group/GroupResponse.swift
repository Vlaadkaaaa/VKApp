// GroupResponse.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// GroupResponse
struct GroupResponse: Decodable {
    /// количество групп
    let count: Int
    /// все группы
    let items: [GroupItem]
}
