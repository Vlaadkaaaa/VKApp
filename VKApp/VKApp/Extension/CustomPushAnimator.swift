// CustomPushAnimator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///
final class CustomPushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        0.7
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to)
        else { return }

        transitionContext.containerView.addSubview(destination.view)
        destination.view.frame = source.view.frame
        
        let transition = CGAffineTransform(translationX: source.view.frame.width, y: 0)

        let rotation = CGAffineTransform(rotationAngle: 270 * .pi / 100)
        destination.view.transform = transition.concatenating(rotation)

        UIView.animateKeyframes(withDuration: transitionDuration(using: transitionContext), delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.75) {
                let transition = CGAffineTransform(translationX: -200, y: 0)
                let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)

                source.view.transform = transition.concatenating(scale)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.4) {
                let transition = CGAffineTransform(translationX: source.view.frame.width / 2, y: 0)
                let scale = CGAffineTransform(scaleX: 1.2, y: 1.2)

                destination.view.transform = transition.concatenating(scale)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4) {
                destination.view.transform = .identity
            }
        } completion: { result in
            if result, !transitionContext.transitionWasCancelled {
                source.view.transform = .identity
            }
            transitionContext.completeTransition(result && !transitionContext.transitionWasCancelled)
        }
    }
}
