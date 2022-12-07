// HeaderViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Header для поста
final class HeaderViewCell: UITableViewCell, NewsConfigurable {
    // MARK: - Private Constants

    private enum Constants {
        static let dateFormatText = "MM-dd-yyyy HH:mm"
    }

    // MARK: - Private IBOutlet

    @IBOutlet private var authorImageView: UIImageView! {
        didSet {
            authorImageView.layer.cornerRadius = authorImageView.frame.height / 2
        }
    }

    @IBOutlet private var authorLabel: UILabel!
    @IBOutlet private var dateLabel: UILabel!

    // MARK: - Public Methods

    func configure(news: NewsResponseItem, networkService: NetworkService?) {
        authorImageView.loadImage(news.avatarPath ?? "", networkService: NetworkService())
        authorLabel.text = news.authorName
        dateLabel.text = convertDate(date: news.date)
    }

    // MARK: - Private Methods

    private func convertDate(date: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(date))
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.dateFormatText
        return formatter.string(from: date)
    }
}
