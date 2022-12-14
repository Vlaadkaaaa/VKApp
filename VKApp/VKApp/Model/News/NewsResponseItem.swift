// NewsResponseItem.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Данные о новости
final class NewsResponseItem: Decodable {
    /// Дата публикации новости
    var date: Double
    /// SourceID новости
    var sourceID: Int
    /// OwnerID
    var ownerID: Int
    /// Текст новости
    var text: String
    /// Имя автора новости
    var authorName: String?
    /// Ссылка на автар автора новости
    var avatarPath: String?
    /// Ссылка на изображения к новости
    var attachments: [NewsPhotoPost]?
    /// Количество лайков
    var likes: Likes
    /// Количество комментариев
    var comments: Comments
    /// Количество репостов
    var reposts: Reposts
    /// Количество просмотров
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
