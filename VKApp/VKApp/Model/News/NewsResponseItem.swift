// NewsResponseItem.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Данные о новости
final class NewsResponseItem: Decodable {
    /// Дата публикации новости
    let date: Double
    /// SourceID новости
    let sourceID: Int
    /// OwnerID
    let ownerID: Int
    /// Текст новости
    let text: String
    /// Имя автора новости
    var authorName: String?
    /// Ссылка на автар автора новости
    var avatarPath: String?
    /// Ссылка на изображения к новости
    let attachments: [NewsPhotoPost]?
    /// Количество лайков
    let likes: Likes
    /// Количество комментариев
    let comments: Comments
    /// Количество репостов
    let reposts: Reposts
    /// Количество просмотров
    let views: Views

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
