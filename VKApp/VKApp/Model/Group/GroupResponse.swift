// GroupResponse.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// GroupResponse
struct GroupResponse: Decodable {
    let count: Int
    let items: [GroupItem]
}
