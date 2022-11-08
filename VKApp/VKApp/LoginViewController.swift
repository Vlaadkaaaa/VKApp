// LoginViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран авторизации
final class LoginViewController: UIViewController {
    // MARK: Private Constants

    private enum Constants {
        static let friendTabBarSegueIdentifier = "friendTabBarSegue"
        static let userDataText = ""
        static let errorTitleText = "Ошибка!"
        static let errorMessageText = "Логин и/или пароль введены неверно"
    }

    // MARK: - Private IBOutlet

    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var loginTextField: UITextField!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGestureRecognizer()
    }

    // MARK: - Private IBAcrion

    @IBAction private func logInAction(_ sender: UIButton) {
        guard let loginTextField = loginTextField.text,
              let passwordTextField = passwordTextField.text
        else {
            return
        }
        loginAuthentication(loginTextField, passwordTextField)
    }

    // MARK: - Prviate Methods

    private func setupGestureRecognizer() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardAction))
        scrollView.addGestureRecognizer(gesture)
    }

    private func loginAuthentication(_ login: String, _ password: String) {
        guard login == Constants.userDataText,
              password == Constants.userDataText
        else {
            showAlertError(title: Constants.errorTitleText, message: Constants.errorMessageText)
            return
        }
        performSegue(withIdentifier: Constants.friendTabBarSegueIdentifier, sender: self)
    }

    @objc private func hideKeyboardAction() {
        scrollView.endEditing(true)
    }
}
