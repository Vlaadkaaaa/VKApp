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
    }

    // MARK: - Private @IBOutlet

    @IBOutlet private var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        getURl()
    }

    // MARK: - Private Methods

    private func getURl() {
        var urlComponents = URLComponents()
        urlComponents.scheme = Constants.shemeUrlComponent
        urlComponents.host = Constants.hostUrlComponent
        urlComponents.path = Constants.pathUrlComponent
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: Session.shared.userId),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        guard let url = urlComponents.url else { return }
        let request = URLRequest(url: url)

        webView.load(request)
    }
}

extension LoginWebViewController: WKNavigationDelegate {
    func webView(
        _ webView: WKWebView,
        decidePolicyFor navigationResponse: WKNavigationResponse,
        decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void
    ) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }.reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        guard let token = params["access_token"] else { return }
        decisionHandler(.cancel)
        Session.shared.token = token
        guard webView.isLoading else { return }
        performSegue(withIdentifier: Constants.loginWebGegieIdentifier, sender: self)
    }
}
