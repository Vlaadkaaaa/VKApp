// LoginViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Страница авторизации
final class LoginViewController: UIViewController {
    // MARK: Private Constants

    private enum Constats {
        static let friendTabBarSegueIdentifier = "friendTabBarSegue"
        static let userData = "admin"
        static let errorTitleText = "Ошибка!"
        static let errorMessageText = "Логин и/или пароль введены неверно"
        static let okAlertText = "Ok"
    }

    // MARK: - Private IBOutlet

    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginTextField: UITextField!

    // MARK: - Private Property

    private lazy var gesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardAction))

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGestureRecognizer()
    }

    // MARK: - IBAcrion

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
        scrollView.addGestureRecognizer(gesture)
    }

    private func loginAuthentication(_ login: String, _ password: String) {
        guard login == Constats.userData,
              password == Constats.userData
        else {
            errorAuthentication()
            return
        }
        performSegue(withIdentifier: Constats.friendTabBarSegueIdentifier, sender: self)
    }

    private func errorAuthentication() {
        let alert = UIAlertController(
            title: Constats.errorTitleText,
            message: Constats.errorMessageText,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: Constats.okAlertText, style: .cancel))
        present(alert, animated: true)
    }

    @objc private func hideKeyboardAction() {
        scrollView.endEditing(true)
    }
}
