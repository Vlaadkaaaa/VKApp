// LikeViewControl.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///  Добавление лайков на фото
final class LikeViewControl: UIControl {
    // MARK: - Private Constants

    private enum Constants {
        static let heartButtonImageName = "heart"
        static let heartFillButtonImageName = "heart.fill"
    }

    // MARK: - Private Visual Component

    private lazy var likeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        button.setImage(UIImage(systemName: Constants.heartButtonImageName), for: .normal)
        button.addTarget(self, action: #selector(likePhoto), for: .touchUpInside)
        return button
    }()

    private lazy var likesCountLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 0, width: 20, height: 20))
        label.text = "\(countLikes)"
        return label
    }()

    // MARK: - Private Property

    private var isLike = false
    private var countLikes = 0

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        addSubview(likeButton)
        addSubview(likesCountLabel)
    }

    @objc private func likePhoto() {
        if !isLike {
            likeButton.setImage(UIImage(systemName: Constants.heartFillButtonImageName), for: .normal)
            countLikes += 1
            likesCountLabel.textColor = .systemBlue

        } else {
            likeButton.setImage(UIImage(systemName: Constants.heartButtonImageName), for: .normal)
            countLikes -= 1
            likesCountLabel.textColor = .white
        }
        isLike = !isLike
        likesCountLabel.text = "\(countLikes)"
    }
}
