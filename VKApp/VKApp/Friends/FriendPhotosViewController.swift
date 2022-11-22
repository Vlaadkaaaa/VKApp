// FriendPhotosViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран всех фотографий друга
final class FriendPhotosViewController: UIViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let duration = 0.3
        static let scale = 0.9
        static let imageAlpha = 1.0
    }

    // MARK: - Private @IBOutlet

    @IBOutlet private var imageView: UIImageView! {
        didSet {
            imageView.contentMode = .scaleAspectFit
        }
    }

    private lazy var swipeRightGestureRecognizer: UISwipeGestureRecognizer = {
        let swipeGesture = UISwipeGestureRecognizer()
        swipeGesture.direction = .right
        swipeGesture.addTarget(self, action: #selector(swipeAction))
        return swipeGesture
    }()

    private lazy var swipeLeftGestureRecognizer: UISwipeGestureRecognizer = {
        let swipeGesture = UISwipeGestureRecognizer()
        swipeGesture.direction = .left
        swipeGesture.addTarget(self, action: #selector(swipeAction))
        return swipeGesture
    }()

    // MARK: - Public Property

    var friendPhotos: [String] = []

    // MARK: - Private Property

    private var currentIndex = 0

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        NetworkService().getUserPhotos()
    }

    // MARK: - Private Methods

    @objc private func swipeAction(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .right:
            prepareAnimationRightSwipe()
        case .left:
            prepareAnimationLeftSwipe()
        default: break
        }
    }

    private func setupUI() {
        imageView.image = UIImage(named: friendPhotos[currentIndex])
        view.addGestureRecognizer(swipeLeftGestureRecognizer)
        view.addGestureRecognizer(swipeRightGestureRecognizer)
    }

    private func prepareAnimationRightSwipe() {
        guard
            currentIndex < friendPhotos.count,
            currentIndex > 0
        else { return }
        UIView.animate(withDuration: Constants.duration, animations: {
            self.imageView.transform = CGAffineTransform(scaleX: Constants.scale, y: Constants.scale)
            self.imageView.frame.origin.x -= self.imageView.frame.width
            self.imageView.alpha = 0
        }, completion: { _ in
            UIView.animate(withDuration: Constants.duration) {
                self.imageView
                    .image = UIImage(
                        named: self.friendPhotos[self.currentIndex]
                    )
            } completion: { _ in
                self.imageView.frame.origin.x += self.imageView.frame.width
                self.imageView.transform = .identity
                self.imageView.alpha = Constants.imageAlpha
            }
        })
        currentIndex -= 1
    }

    private func prepareAnimationLeftSwipe() {
        guard
            currentIndex < friendPhotos.count - 1,
            currentIndex >= 0
        else { return }
        UIView.animate(withDuration: Constants.duration, animations: {
            self.imageView.transform = CGAffineTransform(scaleX: Constants.scale, y: Constants.scale)
            self.imageView.frame.origin.x += self.imageView.frame.width
            self.imageView.alpha = 0
        }, completion: { _ in
            UIView.animate(withDuration: Constants.duration) {
                self.imageView
                    .image = UIImage(
                        named: self.friendPhotos[self.currentIndex]
                    )
            } completion: { _ in
                self.imageView.frame.origin.x -= self.imageView.frame.width
                self.imageView.transform = .identity
                self.imageView.alpha = Constants.imageAlpha
            }
        })
        currentIndex += 1
    }
}
