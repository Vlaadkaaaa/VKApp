// RealmService.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Работа с базой данных
struct RealmService {
    static let deleteIfMigration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)

    // MARK: - Public Methods

    func saveDataToRealm<T: Object>(_ items: [T]) {
        do {
            let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
            let realm = try Realm(configuration: config)
            try realm.write {
                realm.add(items, update: .modified)
            }
        } catch {
            print(error.localizedDescription)
        }
    }

    func saveImageToRealm<T: Object>(_ items: [T]) {
        do {
            let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
            let realm = try Realm(configuration: config)
            try realm.write {
                realm.add(items)
            }
        } catch {
            print(error.localizedDescription)
        }
    }

    func loadData<T: Object>(
        _ type: T.Type,
        config: Realm.Configuration = Realm.Configuration.defaultConfiguration
    ) -> Results<T>? {
        do {
            let realm = try Realm(configuration: RealmService.deleteIfMigration)
            return realm.objects(type)
        } catch {
            print(error)
        }
        return nil
    }

    func fetchData(completion: (Results<UserItem>) -> Void) {
        do {
            let realm = try Realm()
            let object = realm.objects(UserItem.self)
            completion(object)
        } catch {
            print(error.localizedDescription)
        }
    }
}
