// CustomPushAnimator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///  Настройка анимации перехода вперед
final class CustomPushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    // MARK: - Private Constants

    private enum Constants {
        static let pushAnimationDuration = 0.7
        static let pushAnimationRotation = 270 * Double.pi / 180
        static let transitionXPoints = -200.0
        static let startDefaultScale = 0.8
        static let finishDefaultScale = 1.2
    }

    // MARK: - Public Methods

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        Constants.pushAnimationDuration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to)
        else { return }

        transitionContext.containerView.addSubview(destination.view)
        destination.view.frame = source.view.frame

        let transition = CGAffineTransform(
            translationX: (source.view.frame.width / 2) + (source.view.frame.height / 2),
            y: -source.view.frame.width / 2
        )

        let rotation = CGAffineTransform(rotationAngle: Constants.pushAnimationRotation)
        destination.view.transform = rotation.concatenating(transition)
        animateTransition(from: source, to: destination, transitionContext: transitionContext)
    }

    // MARK: - Private Methods

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
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.75) {
                let transition = CGAffineTransform(translationX: Constants.transitionXPoints, y: 0)
                let scale = CGAffineTransform(scaleX: Constants.startDefaultScale, y: Constants.startDefaultScale)
                from.view.transform = scale.concatenating(transition)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.4) {
                let transition = CGAffineTransform(translationX: from.view.frame.width / 2, y: 0)
                let scale = CGAffineTransform(scaleX: Constants.finishDefaultScale, y: Constants.finishDefaultScale)
                from.view.transform = transition.concatenating(scale)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4) {
                to.view.transform = .identity
            }
        } completion: { result in
            if result, !transitionContext.transitionWasCancelled {
                from.view.transform = .identity
            }
            transitionContext.completeTransition(result && !transitionContext.transitionWasCancelled)
        }
    }
}
