// Session.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

///  Singleton для хранения данных сессии 
struct Session {
    // MARK: - Static Property

    static let shared = Session()

    // MARK: - Public Property

    var token = String()
    var userId = "51483575"

    // MARK: - Private init

    private init() {}
}
