// SaveDataOperation.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// SaveDataOperation
final class SaveDataOperation: Operation {
    var realmService = RealmService()

    override func main() {
        guard let getParseData = dependencies.first as? ParseData else { return }
        let parseData = getParseData.outputData
        guard let groups = parseData?.response.items as? [GroupItem] else { return }
        realmService.saveDataToRealm(groups)
    }
}
