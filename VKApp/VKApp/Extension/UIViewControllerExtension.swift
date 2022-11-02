// UIViewControllerExtension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Extension ErrorAlert
extension UIViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let errorTitleText = "Ошибка!"
        static let errorMessageText = "Логин и/или пароль введены неверно"
        static let okAlertText = "Ok"
    }

    // MARK: - Public Methods

    func errorAuthentication() {
        let alert = UIAlertController(
            title: Constants.errorTitleText,
            message: Constants.errorMessageText,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: Constants.okAlertText, style: .cancel))
        present(alert, animated: true)
    }
}
