// PhotoItem.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// PhotoItem
final class PhotoItem: Object, Decodable {
    @Persisted var sizes = List<Size>()
}

/// Путь к фотографии пользователя
final class Size: Object, Decodable {
    @Persisted var url: String
}
