// RealmService.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Работа с базой данных
struct RealmService {
    // MARK: - Public Methods

    func saveDataToRealm<T: Object>(_ items: [T]) {
        do {
            let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)

            let realm = try Realm(configuration: config)
            print(
                realm.configuration.fileURL
            )
            try realm.write {
                realm.add(items, update: .modified)
            }
        } catch {
            print(error)
        }
    }

    func saveImageToRealm<T: Object>(_ items: [T]) {
        do {
            let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
            let realm = try Realm(configuration: config)
            print(
                realm.configuration.fileURL
            )
            try realm.write {
                realm.add(items)
            }
        } catch {
            print(error)
        }
    }
}
