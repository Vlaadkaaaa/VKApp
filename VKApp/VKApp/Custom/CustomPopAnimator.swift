// CustomPopAnimator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Настройка анимации перехода назад/
final class CustomPopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    // MARK: - Private Constants

    private enum Constants {
        static let popAnimationDuration = 0.7
        static let popAnimationRotation = 90 * Double.pi / 180
        static let transitionXPoints = -200.0
        static let defaultScale = 1.2
    }

    // MARK: - Public Methods

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        Constants.popAnimationDuration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let source = transitionContext.viewController(forKey: .from),
            let destination = transitionContext.viewController(forKey: .to)
        else {
            return
        }
        transitionContext.containerView.addSubview(destination.view)
        transitionContext.containerView.sendSubviewToBack(destination.view)
        destination.view.frame = source.view.frame
        let translation = CGAffineTransform(
            translationX: -(source.view.frame.width / 2 + source.view.frame.height / 2),
            y: -source.view.frame.width / 2
        )
        let rotation = CGAffineTransform(rotationAngle: Constants.popAnimationRotation)
        destination.view.transform = translation.concatenating(rotation)
        animateTransition(from: source, to: destination, transitionContext: transitionContext)
    }

    // MARK: - Private Method

    private func animateTransition(
        from: UIViewController,
        to: UIViewController,
        transitionContext: UIViewControllerContextTransitioning
    ) {
        UIView.animateKeyframes(
            withDuration: transitionDuration(using: transitionContext),
            delay: 0,
            options: .calculationModePaced
        ) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.4) {
                let transition = CGAffineTransform(translationX: from.view.frame.width / 2, y: 0)
                let scale = CGAffineTransform(scaleX: Constants.defaultScale, y: Constants.defaultScale)
                from.view.transform = transition.concatenating(scale)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.4) {
                let transition = CGAffineTransform(translationX: from.view.frame.width / 2, y: 0)
                let scale = CGAffineTransform(scaleX: Constants.defaultScale, y: Constants.defaultScale)
                from.view.transform = transition.concatenating(scale)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.75) {
                to.view.transform = .identity
            }
        } completion: { finished in
            if finished, !transitionContext.transitionWasCancelled {
                from.removeFromParent()
            } else if transitionContext.transitionWasCancelled {
                to.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
    }
}
