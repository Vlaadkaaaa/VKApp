// Session.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

///  Singleton для хранения данных сессии
struct Session {
    // MARK: - Private Constants

    private enum Constants {
        static let userIdText = "51483575"
    }

    // MARK: - Static Property

    static let shared = Session()

    // MARK: - Public Property

    var token = String()
    var userId = Constants.userIdText

    // MARK: - Private init

    private init() {}
}
