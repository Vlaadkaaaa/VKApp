// PostNewTableCellDelegate.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Показ полного текста новостей
protocol PostNewsTableCellDelegate: AnyObject {
    func didTappedTextButton(cell: PostViewCell)
}
