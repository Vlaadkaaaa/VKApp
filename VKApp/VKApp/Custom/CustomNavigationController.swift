// CustomNavigationController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class CustomNavigationController: UINavigationController {
    // MARK: - Private Property

    private let interactiveTransition = CustomInteractiveTrasmition()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
}

// MARK: - UINavigationControllerDelegate

extension CustomNavigationController: UINavigationControllerDelegate {
    func navigationController(
        _ navigationController: UINavigationController,
        animationControllerFor operation: UINavigationController.Operation,
        from fromVC: UIViewController,
        to toVC: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .pop:
            interactiveTransition.viewController = toVC
            return CustomPopAnimator()
        case .push:
            if navigationController.viewControllers.first != toVC {
                interactiveTransition.viewController = toVC
            }
            return CustomPushAnimator()
        default:
            return nil
        }
    }

    func navigationController(
        _ navigationController: UINavigationController,
        interactionControllerFor animationController: UIViewControllerAnimatedTransitioning
    ) -> UIViewControllerInteractiveTransitioning? {
        interactiveTransition.hasStarted ? interactiveTransition : nil
    }
}
