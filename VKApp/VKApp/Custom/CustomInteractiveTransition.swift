// CustomInteractiveTransition.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Кастомизация жеста
final class CustomInteractiveTransition: UIPercentDrivenInteractiveTransition {
    // MARK: - Private Constants

    private enum Constants {
        static let progressValue = 0.33
        static let maxProgressValue = 1.0
        static let minProgressValue = 0.0
    }

    // MARK: - Public Property

    var isStarted = false
    var viewController: UIViewController? {
        didSet {
            let recognizer = UIScreenEdgePanGestureRecognizer(
                target: self,
                action: #selector(handleScreenEdgeGestureAction(_:))
            )
            recognizer.edges = [.left]
            viewController?.view.addGestureRecognizer(recognizer)
        }
    }

    // MARK: - Private Property

    private var isFinish = false

    // MARK: - Private Methods

    @objc private func handleScreenEdgeGestureAction(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            isStarted = true
            viewController?.navigationController?.popViewController(animated: true)
        case .changed:
            let translation = recognizer.translation(in: recognizer.view)
            let relativeTranslation = translation.x / (recognizer.view?.bounds.width ?? 1)
            let progress = max(Constants.minProgressValue, min(Constants.maxProgressValue, relativeTranslation))
            isFinish = progress > Constants.progressValue
            update(progress)
        case .ended:
            isStarted = false
            guard isFinish else {
                cancel()
                return
            }
            finish()
            if isFinish {
                finish()
            } else {
                cancel()
            }
        case .cancelled:
            isStarted = false
            cancel()
        default: return
        }
    }
}
