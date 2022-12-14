// NewsResponseItem.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Данные о новости
final class NewsResponseItem: Decodable {
    /// дата публикации новости
    var date: Double
    /// sourceID новости
    var sourceID: Int
    /// ownerID
    var ownerID: Int
    /// текст новости
    var text: String
    /// имя автора новости
    var authorName: String?
    /// ссылка на автар автора новости
    var avatarPath: String?
    /// ссылка на изображения к новости
    var attachments: [NewsPhotoPost]?
    /// коичество лайков
    var likes: Likes
    /// количество комментариев
    var comments: Comments
    /// количество репостов
    var reposts: Reposts
    /// количество просмотров
    var views: Views

    // MARK: - CodingKeys

    private enum CodingKeys: String, CodingKey {
        case sourceID = "source_id"
        case date
        case ownerID = "owner_id"
        case text
        case authorName
        case avatarPath
        case attachments
        case likes
        case comments
        case reposts
        case views
    }
}
