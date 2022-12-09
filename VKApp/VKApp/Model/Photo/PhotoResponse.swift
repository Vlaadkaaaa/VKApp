// PhotoResponse.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Ответ сервера для фото
struct PhotoResponse: Decodable {
    /// Количество фото
    let count: Int
    /// Список фото
    let items: [PhotoItem]
}
