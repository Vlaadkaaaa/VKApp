// PhotoItem.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// PhotoItem
struct PhotoItem: Decodable {
    let sizes: [Size]
}

/// Size
final class Size: Object, Decodable {
    @objc dynamic var url: String
}
