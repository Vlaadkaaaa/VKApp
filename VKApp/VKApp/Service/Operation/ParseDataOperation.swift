// ParseDataOperation.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Асинхронная операция парсинга групп
final class ParseDataOperation: Operation {
    // MARK: Public Property

    var groups: [GroupItem]?

    // MARK: - Public Method

    override func main() {
        guard let getDataOperation = dependencies.first as? GetDataOperation,
              let data = getDataOperation.data
        else { return }
        guard let groupResponse = try? JSONDecoder().decode(Group.self, from: data) else { return }
        groups = groupResponse.response.items
    }
}
