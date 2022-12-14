// DateFormatter+Extension.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Форсатирование даты
extension DateFormatter {
    func convert(date: Double) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(date))
        let formatter = DateFormatter()
        formatter.dateFormat = "MM.dd.yyyy HH:mm"
        return formatter.string(from: date)
    }
}
