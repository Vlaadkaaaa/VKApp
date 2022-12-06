// NewsModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

///
struct News: Codable {
    let response: NewsResponse
}

///
struct NewsResponse: Codable {
    let items: [NewsResponseItem]
}

///
struct NewsResponseItem: Codable {
    let sourceID, date: Int
    let canDoubtCategory, canSetCategory: Bool?
    let id, ownerID: Int
    let text: String
    let postID: Int
    let edited, carouselOffset: Int?

    enum CodingKeys: String, CodingKey {
        case sourceID = "source_id"
        case date
        case canDoubtCategory = "can_doubt_category"
        case canSetCategory = "can_set_category"
        case id
        case ownerID = "owner_id"
        case text
        case postID = "post_id"
        case edited
        case carouselOffset = "carousel_offset"
    }
}
