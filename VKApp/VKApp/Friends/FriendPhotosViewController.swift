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
        static let minPercent = 0.33
    }

    // MARK: - Private Visual Component

    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isUserInteractionEnabled = true
        return image
    }()

    private let backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    // MARK: - Public Property

    var images: [UIImage] = []

    // MARK: - Private Property

    private var currentIndex = 0
    private var currentSign = 0
    private var percent: CGFloat = 0
    private var interactiveAnimator: UIViewPropertyAnimator?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(onPanAction))
        setupLayout(imageView: backgroundImageView)
        setupLayout(imageView: imageView)
        setImages()
        imageView.addGestureRecognizer(gesture)
    }

    private func setupLayout(imageView: UIImageView) {
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            imageView.heightAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }

    private func setImages() {
        backgroundImageView.alpha = 0.0
        backgroundImageView.transform = .init(scaleX: 0.8, y: 0.8)
        let firstImage = images[currentIndex]
        var nextIndex = currentIndex + 1
        var bacgroundImage: UIImage?

        if currentSign > 0 {
            nextIndex = currentIndex - 1
        }
        if nextIndex < images.count - 1, nextIndex >= 0 {
            bacgroundImage = images[nextIndex]
        }
        imageView.image = firstImage
        backgroundImageView.image = bacgroundImage
    }

    private func initAnimator() {
        interactiveAnimator?.stopAnimation(true)
        interactiveAnimator = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut, animations: {
            let width = CGFloat(self.currentSign) * self.view.frame.width
            let translationTransform = CGAffineTransform(translationX: width, y: 0)
            let angle = CGFloat(self.currentSign) * 0.8
            let angleTransform = CGAffineTransform(rotationAngle: angle)
            self.imageView.transform = angleTransform.concatenating(translationTransform)
            self.backgroundImageView.alpha = 1.0
            self.backgroundImageView.transform = .identity
        })
        interactiveAnimator?.startAnimation()
        interactiveAnimator?.pauseAnimation()
    }

    private func resetImageView() {
        backgroundImageView.alpha = 0.0
        backgroundImageView.transform = .init(scaleX: 0.8, y: 0.8)
        imageView.transform = .identity
        setImages()
        view.layoutIfNeeded()
        currentSign = 0
        interactiveAnimator = nil
    }

    @objc private func onPanAction(_ gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .changed:
            let translation = gesture.translation(in: view)
            percent = abs(translation.x) / view.frame.width
            let translationX = Int(translation.x)
            let sign = translationX == 0 ? 1 : translationX / abs(translationX)

            if interactiveAnimator == nil || sign != currentSign {
                interactiveAnimator?.stopAnimation(true)
                resetImageView()
                interactiveAnimator = nil
                if sign > 0 && currentIndex > 0 || sign < 0 && currentIndex < images.count - 1 {
                    currentSign = sign
                    setImages()
                    initAnimator()
                }
                interactiveAnimator?.fractionComplete = abs(translation.x) / (view.frame.width / 2)
            }
        case .ended:
            interactiveAnimator?.addCompletion { _ in
                self.resetImageView()
            }
            if percent < Constants.minPercent {
                interactiveAnimator?.stopAnimation(true)
                UIView.animate(withDuration: 0.3) {
                    self.resetImageView()
                }
            } else {
                currentIndex += currentSign * -1
                interactiveAnimator?.continueAnimation(withTimingParameters: nil, durationFactor: 0)
            }
        default:
            break
        }
    }
}
