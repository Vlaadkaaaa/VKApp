// PostViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с текстом поста
final class PostViewCell: UITableViewCell, NewsConfigurable {
    // MARK: - Private Constants

    private enum Constants {
        static let showLessText = "Show less"
        static let showMoreText = "Show more"
        static let maxLengthTextNumber = 200
        static let zeroLinesNumber = 0
        static let threeLinesNumber = 3
    }

    // MARK: - Private IBOutlet

    @IBOutlet private var postLabel: UILabel!
    @IBOutlet private var showButton: UIButton!

    // MARK: - Public Property

    var isTapped = false {
        didSet {
            updateCell()
        }
    }

    weak var delegate: PostNewsTableCellDelegate?

    // MARK: - Public Methods

    func configure(news: NewsResponseItem) {
        postLabel.text = news.text
        updateCell()
    }

    // MARK: - Private IBAction

    @IBAction private func showMoreTextAction(_ sender: UIButton) {
        delegate?.didTappedTextButton(cell: self)
    }

    // MARK: - Private methods

    private func updateCell() {
        let title = isTapped ? Constants.showLessText : Constants.showMoreText
        postLabel.numberOfLines = isTapped ? Constants.zeroLinesNumber : Constants.threeLinesNumber
        showButton.isHidden = postLabel.text?.count ?? 0 < Constants.maxLengthTextNumber
        showButton.setTitle(title, for: .normal)
    }
}
