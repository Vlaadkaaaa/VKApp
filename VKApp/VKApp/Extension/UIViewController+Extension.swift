// UIViewController+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Extension ErrorAlert
extension UIViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let buttonTitleText = "Ok"
    }

    // MARK: - Public Methods

    func showAlertError(title: String?, message: String?) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: Constants.buttonTitleText, style: .cancel))
        present(alert, animated: true)
    }
}
