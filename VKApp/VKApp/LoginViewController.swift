// LoginViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Страница авторизации
final class LoginViewController: UIViewController {
    // MARK: Private Constants

    private enum Constants {
        static let friendTabBarSegueIdentifier = "friendTabBarSegue"
        static let userDataText = "admin"
    }

    // MARK: - Private IBOutlet

    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var loginTextField: UITextField!

    // MARK: - Private Property

    private lazy var gesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardAction))

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
        scrollView.addGestureRecognizer(gesture)
    }

    private func loginAuthentication(_ login: String, _ password: String) {
        guard login == Constants.userDataText,
              password == Constants.userDataText
        else {
            errorAuthentication()
            return
        }
        performSegue(withIdentifier: Constants.friendTabBarSegueIdentifier, sender: self)
    }

    @objc private func hideKeyboardAction() {
        scrollView.endEditing(true)
    }
}

// MARK: - ErrorAlert

extension LoginViewController {}
