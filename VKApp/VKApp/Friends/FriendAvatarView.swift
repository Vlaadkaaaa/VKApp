// FriendAvatarView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// VIew Для настройки аватара друзей
@IBDesignable final class FriendAvatarView: UIView {
    // MARK: - Private Visual Components

    private lazy var avatarImageView: UIImageView = {
        let image = UIImageView()
        image.isUserInteractionEnabled = true
        image.layer.masksToBounds = true
        image.frame = bounds
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .white
        image.layer.cornerRadius = bounds.width / 2
        return image
    }()

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
        setupGesture()
    }

    // MARK: - Public Methods

    func setupAvatarImage(_ image: String) {
        avatarImageView.loadURL(image)
    }

    // MARK: - Private Methods

    private func setupUI() {
        addSubview(avatarImageView)
        updateShadow()
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

    private func setupGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureAction))
        avatarImageView.addGestureRecognizer(gesture)
    }

    @objc private func tapGestureAction() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.1) {
            self.avatarImageView.bounds = CGRect(
                x: self.avatarImageView.center.x,
                y: self.avatarImageView.center.y,
                width: 60,
                height: 60
            )
        } completion: { _ in
            self.avatarImageView.bounds = CGRect(
                x: self.avatarImageView.center.x,
                y: self.avatarImageView.center.y,
                width: 50,
                height: 50
            )
        }
    }
}
