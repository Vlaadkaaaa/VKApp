// HeaderViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Header для поста
final class HeaderViewCell: UITableViewCell, NewsConfigurable {
    // MARK: - Private Constants

    private enum Constants {
        static let dateFormatText = "MM-dd-yyyy HH:mm"
    }

    // MARK: - Private Property

    let networkService = NetworkService()

    // MARK: - Private IBOutlet

    @IBOutlet private var authorImageView: UIImageView! {
        didSet {
            authorImageView.layer.cornerRadius = authorImageView.frame.height / 2
        }
    }

    @IBOutlet private var authorLabel: UILabel!
    @IBOutlet private var dateLabel: UILabel!

    // MARK: - Public Methods

    func configure(news: NewsResponseItem) {
        authorImageView.loadImage(news.avatarPath ?? "", networkService: networkService)
        authorLabel.text = news.authorName
        dateLabel.text = convert(date: news.date)
    }

    // MARK: - Private Methods

    private func convert(date: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(date))
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.dateFormatText
        return formatter.string(from: date)
    }
}
