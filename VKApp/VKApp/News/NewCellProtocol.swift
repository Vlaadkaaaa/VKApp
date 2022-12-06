// NewCellProtocol.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

typealias NewsCell = NewsConfigurable & UITableViewCell

protocol NewsConfigurable {
    func configure(news: NewsBase)
}
