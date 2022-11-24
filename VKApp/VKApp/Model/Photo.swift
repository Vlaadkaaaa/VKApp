// Photo.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

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
struct Size: Decodable {
    let url: String
}
