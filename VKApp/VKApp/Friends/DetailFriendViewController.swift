// DetailFriendViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class DetailFriendViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    private var peopleName = "people-"
    private var peopleCount = 2

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

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "\(peopleName)\(peopleCount)")
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
        peopleCount += 1
        imageView.image = UIImage(named: "\(peopleName)\(peopleCount)")
    }

    private func swipeLeft1() {
        peopleCount -= 1
        imageView.image = UIImage(named: "\(peopleName)\(peopleCount)")
    }
}
