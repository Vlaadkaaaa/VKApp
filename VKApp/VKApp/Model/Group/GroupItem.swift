// GroupItem.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// GroupItem
@objcMembers
final class GroupItem: Object, Codable {
    dynamic var id: Int
    dynamic var name: String
    dynamic var photo: String

    override static func primaryKey() -> String? {
        "id"
    }

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photo = "photo_100"
    }
}
