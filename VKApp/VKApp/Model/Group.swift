// Group.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Группы
struct Group: Codable {
    let response: GroupResponse
}

/// GroupResponse
struct GroupResponse: Codable {
    let count: Int
    let items: [GroupItem]
}

/// GroupItem
struct GroupItem: Codable {
    let id: Int
    let name: String
    let photo: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photo = "photo_100"
    }
}
