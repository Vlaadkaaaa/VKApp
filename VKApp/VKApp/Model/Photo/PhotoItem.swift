// PhotoItem.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// PhotoItem
final class PhotoItem: Object, Decodable {
    // MARK: - Public Property

    /// Коллекция фото пользователя
    @Persisted var sizes = List<Size>()
}
