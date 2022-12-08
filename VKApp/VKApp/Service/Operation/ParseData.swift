// ParseData.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// ParseData
final class ParseData: Operation {
    var outputData: Group?

    override func main() {
        guard let getDataOperation = dependencies.first as? GetDataOperation,
              let data = getDataOperation.data
        else { return }
        guard let groupResponse = try? JSONDecoder().decode(Group.self, from: data) else { return }
        outputData = groupResponse
    }
}
