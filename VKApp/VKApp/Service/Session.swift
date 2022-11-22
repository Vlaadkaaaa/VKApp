// Session.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Session
struct Session {
    // MARK: - Private init

    private init() {}

    // MARK: - Static Property

    static var shared = Session()

    // MARK: - Public Property

    var token = String()
    var userId = "51483575"
}
