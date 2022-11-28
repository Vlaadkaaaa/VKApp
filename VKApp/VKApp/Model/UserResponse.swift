// UserResponse.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// UserResponse
struct UserResponse: Codable {
    let count: Int
    let items: [UserItem]
}
