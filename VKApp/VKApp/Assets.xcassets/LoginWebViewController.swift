// LoginWebViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

/// Экран авторизациии в браузере
final class LoginWebViewController: UIViewController {
    // MARK: - Private Constants

    private enum Constants {
        static let shemeUrlComponent = "https"
        static let hostUrlComponent = "oauth.vk.com"
        static let pathUrlComponent = "/authorize"
        static let loginWebGegieIdentifier = "LoginWebSegue"
        static let blankPath = "/blank.html"
        static let ampersant = "&"
        static let equals = "="
        static let accessTokenName = "access_token"
        static let userIdName = "user_id"
        static let clientIdIext = "client_id"
        static let displayText = "display"
        static let mobileText = "mobile"
        static let redirectUriText = "redirect_uri"
        static let httpsText = "https://oauth.vk.com/blank.html"
        static let scopeText = "scope"
        static let numberText = "wall,friends"
        static let responseTypeText = "response_type"
        static let tokenText = "token"
        static let vText = "v"
        static let versionText = "5.68"
    }

    // MARK: - Private @IBOutlet

    @IBOutlet private var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }

    // MARK: - Private Property

    private var session = Session.shared

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebView()
    }

    // MARK: - Private Methods

    private func loadWebView() {
        var urlComponents = URLComponents()
        urlComponents.scheme = Constants.shemeUrlComponent
        urlComponents.host = Constants.hostUrlComponent
        urlComponents.path = Constants.pathUrlComponent
        urlComponents.queryItems = [
            URLQueryItem(name: Constants.clientIdIext, value: Session.shared.userId),
            URLQueryItem(name: Constants.displayText, value: Constants.mobileText),
            URLQueryItem(name: Constants.redirectUriText, value: Constants.httpsText),
            URLQueryItem(name: Constants.scopeText, value: Constants.numberText),
            URLQueryItem(name: Constants.responseTypeText, value: Constants.tokenText),
            URLQueryItem(name: Constants.vText, value: Constants.versionText)
        ]
        guard let url = urlComponents.url else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

// MARK: - LoginWebViewController

extension LoginWebViewController: WKNavigationDelegate {
    func webView(
        _ webView: WKWebView,
        decidePolicyFor navigationResponse: WKNavigationResponse,
        decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void
    ) {
        guard let url = navigationResponse.response.url, url.path == Constants.blankPath,
              let fragment = url.fragment
        else {
            decisionHandler(.allow)
            return
        }
        let params = fragment
            .components(separatedBy: Constants.ampersant)
            .map { $0.components(separatedBy: Constants.equals) }.reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        guard let token = params[Constants.accessTokenName] else { return }
        decisionHandler(.cancel)
        session.token = token

        guard webView.isLoading else { return }
        performSegue(withIdentifier: Constants.loginWebGegieIdentifier, sender: self)
    }
}
