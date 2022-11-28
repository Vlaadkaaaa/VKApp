// RealmDB.swift
// Copyright © RoadMap. All rights reserved.

import RealmSwift

/// Работа с базой данных
struct RealmDB {
    // MARK: - Public Methods

    func saveDataToRealm(_ items: [GroupItem]) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(items)
            }
        } catch {
            print(error)
        }
    }
}
