// Group.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Группы
struct Group {
    let name: String
    let imageName: String
}

// MARK: - GroupWelcome

///
struct GroupWelcome: Codable {
    let response: GroupResponse
}

// MARK: - Response

///
struct GroupResponse: Codable {
    let count: Int
    let items: [GroupItem]
}

// MARK: - Item

///
struct GroupItem: Codable {
    let id: Int
    let name, screenName: String
    let isClosed: Int
    let type: String
    let isAdmin, isMember, isAdvertiser: Int
    let photo100: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case screenName = "screen_name"
        case isClosed = "is_closed"
        case type
        case isAdmin = "is_admin"
        case isMember = "is_member"
        case isAdvertiser = "is_advertiser"
        case photo100 = "photo_100"
    }
}
