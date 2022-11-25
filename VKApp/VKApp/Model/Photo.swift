// Photo.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import RealmSwift

/// Photo
struct Photo: Decodable {
    let response: PhotoResponse?
}

/// PhotoResponse
struct PhotoResponse: Decodable {
    let count: Int
    let items: [PhotoItem]
}

/// PhotoItem
struct PhotoItem: Decodable {
    let sizes: [Size]
}

/// Size
final class Size: Object, Decodable {
    @objc dynamic var url: String
}
