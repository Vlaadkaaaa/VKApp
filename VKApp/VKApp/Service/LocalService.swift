// LocalService.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Работы с локальными данными
final class LocalService {
    // MARK: - Public Methods

    func fetchData(completion: (Results<UserItem>) -> Void) {
        do {
            let realm = try Realm()
            let object = realm.objects(UserItem.self)
            completion(object)
        } catch {
            print(error)
        }
    }
}
