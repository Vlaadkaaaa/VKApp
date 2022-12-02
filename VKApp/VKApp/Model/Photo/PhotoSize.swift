// PhotoSize.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Путь к фотографии пользователя
final class Size: Object, Decodable {
    // MARK: - Public Property

    @Persisted var url: String
}
