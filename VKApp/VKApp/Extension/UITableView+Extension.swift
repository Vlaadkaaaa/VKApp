// UITableView+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Сообщение при пустой таблице
extension UITableView {
    func showEmptyMessage(_ message: String) {
        let label: UILabel = {
            let label = UILabel()
            label.textColor = .gray
            label.numberOfLines = 0
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 25, weight: .semibold)
            label.text = message
            return label
        }()

        backgroundView = label
    }

    func hideEmptyMessage() {
        backgroundView = nil
    }
}
