// PhotoResponse.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// PhotoResponse
struct PhotoResponse: Decodable {
    let count: Int
    let items: [PhotoItem]
}
