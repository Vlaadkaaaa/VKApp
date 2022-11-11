// FriendPhotosViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран всех фотографий друга
final class FriendPhotosViewController: UIViewController {
    @IBOutlet private var imageView: UIImageView! {
        didSet {
            imageView.contentMode = .scaleAspectFit
        }
    }

    lazy var swipeRight: UISwipeGestureRecognizer = {
        let swipe = UISwipeGestureRecognizer()
        swipe.direction = .right
        swipe.addTarget(self, action: #selector(swipeAction))
        return swipe
    }()

    lazy var swipeLeft: UISwipeGestureRecognizer = {
        let swipe = UISwipeGestureRecognizer()
        swipe.direction = .left
        swipe.addTarget(self, action: #selector(swipeAction))
        return swipe
    }()

    // MARK: - Public Property

    var friendPhotos: [String] = []

    // MARK: - Private Property

    private var currentIndex = 0

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
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
        view.addGestureRecognizer(swipeLeft)
        view.addGestureRecognizer(swipeRight)
    }

    private func prepareAnimationRightSwipe() {
        guard
            currentIndex < friendPhotos.count,
            currentIndex > 0
        else { return }
        UIView.animate(withDuration: 0.3, animations: {
            self.imageView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            self.imageView.frame.origin.x -= self.imageView.frame.width
            self.imageView.alpha = 0
        }, completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.imageView
                    .image = UIImage(
                        named: self.friendPhotos[self.currentIndex]
                    )
            } completion: { _ in
                self.imageView.frame.origin.x += self.imageView.frame.width
                self.imageView.transform = .identity
                self.imageView.alpha = 1
            }
        })
        currentIndex -= 1
    }

    private func prepareAnimationLeftSwipe() {
        guard
            currentIndex < friendPhotos.count - 1,
            currentIndex >= 0
        else { return }
        UIView.animate(withDuration: 0.3, animations: {
            self.imageView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            self.imageView.frame.origin.x += self.imageView.frame.width
            self.imageView.alpha = 0
        }, completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.imageView
                    .image = UIImage(
                        named: self.friendPhotos[self.currentIndex]
                    )
            } completion: { _ in
                self.imageView.frame.origin.x -= self.imageView.frame.width
                self.imageView.transform = .identity
                self.imageView.alpha = 1
            }
        })
        currentIndex += 1
    }
}
