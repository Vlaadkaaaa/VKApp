// ParseDataOperation.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Парсинг данных
final class ParseDataOperation: Operation {
    // MARK: Public Property

    var outputData: Group?

    // MARK: - Public Method

    override func main() {
        guard let getDataOperation = dependencies.first as? GetDataOperation,
              let data = getDataOperation.data
        else { return }
        guard let groupResponse = try? JSONDecoder().decode(Group.self, from: data) else { return }
        outputData = groupResponse
    }
}
