// NewsResponse.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Список новостей
struct NewsResponse: Decodable {
    var items: [NewsResponseItem]
    var profiles: [UserItem]
    var groups: [GroupItem]
}
