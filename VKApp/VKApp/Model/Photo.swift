// Photo.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Photo
struct Photo: Decodable {
    let response: PhotoResponse?
}

// MARK: - Response

///
struct PhotoResponse: Decodable {
    let count: Int
    let items: [PhotoItem]
}

// MARK: - Item

///
struct PhotoItem: Decodable {
    let albumID, date, id, ownerID: Int
    let text: String
    let sizes: [Size]

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case date, id
        case ownerID = "owner_id"
        case text
        case sizes
    }
}

// MARK: - Size

///
struct Size: Decodable {
    let height: Int
    let width: Int
    let url: String
}
