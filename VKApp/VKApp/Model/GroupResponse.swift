// GroupResponse.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// GroupResponse
struct GroupResponse: Codable {
    let count: Int
    let items: [GroupItem]
}
