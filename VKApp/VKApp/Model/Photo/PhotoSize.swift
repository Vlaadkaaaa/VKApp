// PhotoSize.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Путь к фотографии пользователя
final class Size: Object, Decodable {
    // MARK: - Public Property

    /// Путь к фото пользователя
    @Persisted var url: String
    /// Ширина фотографии
    let width: Int
    /// Высота фотографии
    let height: Int
    /// Соотношение сторон у фотографии
    var aspectRatio: Float {
        Float(height) / Float(width)
    }

    override class func ignoredProperties() -> [String] {
        ["width", "height", "aspectRatio"]
    }
}
