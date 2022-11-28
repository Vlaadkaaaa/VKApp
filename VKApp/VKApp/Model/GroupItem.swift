// GroupItem.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// GroupItem
final class GroupItem: Object, Codable {
    @objc dynamic var id: Int
    @objc dynamic var name: String
    @objc dynamic var photo: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photo = "photo_100"
    }
}
