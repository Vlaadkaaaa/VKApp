// DetailFriendViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран всех фотографий друга
final class DetailFriendViewController: UIViewController {
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

    var index = Int()
    var friend: FriendKey?

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: friend?.dictionary[index]?.profileImagesName?.randomElement() ?? "")
        view.addGestureRecognizer(swipeLeft)
        view.addGestureRecognizer(swipeRight)
    }

    // MARK: - Private Methods

    @objc private func swipeAction(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .right:
            swipeRight1()
        case .left:
            swipeLeft1()
        default: break
        }
    }

    private func swipeRight1() {
        UIView.animate(withDuration: 0.3, animations: {
            self.imageView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            self.imageView.frame.origin.x -= self.imageView.frame.width
            self.imageView.alpha = 0
        }, completion: { _ in
            UIView.animate(withDuration: 0.3, animations: {
                self.imageView
                    .image = UIImage(
                        named: self.friend?.dictionary[self.index]?.profileImagesName?
                            .randomElement() ?? ""
                    )
            }, completion: { _ in
                self.imageView.frame.origin.x += self.imageView.frame.width
                self.imageView.transform = .identity
                self.imageView.alpha = 1
            })
        })
    }

    private func swipeLeft1() {
        UIView.animate(withDuration: 0.3, animations: {
            self.imageView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            self.imageView.frame.origin.x += self.imageView.frame.width
            self.imageView.alpha = 0
        }, completion: { _ in
            UIView.animate(withDuration: 0.3, animations: {
                self.imageView
                    .image = UIImage(
                        named: self.friend?.dictionary[self.index]?.profileImagesName?
                            .randomElement() ?? ""
                    )
            }, completion: { _ in
                self.imageView.frame.origin.x -= self.imageView.frame.width
                self.imageView.transform = .identity
                self.imageView.alpha = 1
            })
        })
    }
}
