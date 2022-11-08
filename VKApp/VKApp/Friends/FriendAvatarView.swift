// FriendAvatarView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// VIew Для настройки аватара друзей
@IBDesignable final class FriendAvatarView: UIView {
    // MARK: - Private Visual Components

    private lazy var avatarImageView: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.frame = bounds
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .white
        image.layer.cornerRadius = bounds.width / 2
        image.addGestureRecognizer(gesture)
        return image
    }()

    let gesture = UITapGestureRecognizer(target: FriendAvatarView.self, action: #selector(tapGestureAction))

    @IBInspectable private var shadowOpacity: Float = 1 {
        didSet {
            updateShadowOpacity()
        }
    }

    @IBInspectable private var shadowColor: UIColor = .red {
        didSet {
            updateShadowColor()
        }
    }

    @IBInspectable private var shadowRadius: CGFloat = 10 {
        didSet {
            updateShadowRadius()
        }
    }

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    // MARK: - Public Methods

    func setupAvatarImage(_ imageName: String) {
        avatarImageView.image = UIImage(named: imageName)
    }

    // MARK: - Private Methods

    private func setupUI() {
        addSubview(avatarImageView)
        updateShadow()
        setupGesture()
    }

    private func updateShadow() {
        layer.cornerRadius = bounds.width / 2
        updateShadowRadius()
        updateShadowOpacity()
        updateShadowColor()
    }

    private func updateShadowRadius() {
        layer.shadowRadius = shadowRadius
    }

    private func updateShadowColor() {
        layer.shadowColor = shadowColor.cgColor
    }

    private func updateShadowOpacity() {
        layer.shadowOpacity = shadowOpacity
    }

    private func setupGesture() {}

    @objc private func tapGestureAction() {
        print("TapTapTap")
    }
}
