// LoginViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран авторизации
final class LoginViewController: UIViewController {
    // MARK: Private Constants

    private enum Constants {
        static let friendTabBarSegueIdentifier = "friendTabBarSegue"
        static let userDataText = "admin"
        static let errorTitleText = "Ошибка!"
        static let errorMessageText = "Логин и/или пароль введены неверно"
    }

    // MARK: - Private IBOutlet

    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var loginTextField: UITextField!
    @IBOutlet private var loadIndicatorView: UIView! {
        didSet {
            loadIndicatorView.isHidden = true
        }
    }

    @IBOutlet private var thirdPointView: UIView! {
        didSet {
            thirdPointView.layer.cornerRadius = thirdPointView.frame.width / 2
        }
    }

    @IBOutlet private var secondPointView: UIView! {
        didSet {
            secondPointView.layer.cornerRadius = secondPointView.frame.width / 2
        }
    }

    @IBOutlet private var firstPointView: UIView! {
        didSet {
            firstPointView.layer.cornerRadius = firstPointView.frame.width / 2
        }
    }

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

    // MARK: - Private Methods

    private func setupGestureRecognizer() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardAction))
        scrollView.addGestureRecognizer(gesture)
    }

    private func loginAuthentication(_ login: String, _ password: String) {
        loadIndicatorView.isHidden = false
        guard login == Constants.userDataText,
              password == Constants.userDataText
        else {
            showAlertError(title: Constants.errorTitleText, message: Constants.errorMessageText)
            loadIndicatorView.isHidden = true
            return
        }
        animateView()
    }

    private func animateView() {
        UIView.animate(withDuration: 1.0, delay: 0, options: [.autoreverse]) {
            self.firstPointView.alpha = 0.5
            self.secondPointView.alpha = 0.9
            self.thirdPointView.alpha = 0.5
            self.firstPointView.alpha = 0.1
            self.secondPointView.alpha = 0.5
            self.thirdPointView.alpha = 0.9
        } completion: { _ in
            self.firstPointView.alpha = 0.9
            self.secondPointView.alpha = 0.9
            self.thirdPointView.alpha = 0.9
            self.performSegue(withIdentifier: Constants.friendTabBarSegueIdentifier, sender: self)
        }
    }

    @objc private func hideKeyboardAction() {
        scrollView.endEditing(true)
    }
}
