// SaveDataOperation.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// SaveDataOperation
final class SaveDataOperation: Operation {
    // MARK: - Public Property

    var realmService = RealmService()

    // MARK: - public Method

    override func main() {
        guard let getParseData = dependencies.first as? ParseDataOperation else { return }
        let parseData = getParseData.outputData
        guard let groups = parseData?.response.items as? [GroupItem] else { return }
        realmService.saveDataToRealm(groups)
    }
}
