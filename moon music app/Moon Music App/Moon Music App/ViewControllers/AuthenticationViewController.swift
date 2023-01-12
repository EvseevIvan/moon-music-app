//
//  AuthenticationViewController.swift
//  Moon Music App
//
//  Created by Иван Евсеев on 09.01.2023.
//

import UIKit
import WebKit
import Spotify_Kit


class AuthenticationViewController: UIViewController, WKNavigationDelegate {
    
    let webView: WKWebView = {
        let preferenses = WKWebpagePreferences()
        preferenses.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = preferenses
        let webView = WKWebView(frame: .zero, configuration: config)
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let config = SpotifyKitConfiguration(scopes: "", redirectUri: "https://github.com/EvseevIvan", clientID: "39c7757d887d42c188800b0054d32bf1", clientSecret: "5c9893f7c5b84699b5e74befd66658a8")
        SpotifyAuthManager.shared.configure(with: config)
                
        webView.navigationDelegate = self
        view.addSubview(webView)

        guard let url = SpotifyAuthManager.shared.signInURL else {
            return
        }
        webView.load(URLRequest(url: url))

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        guard let url = webView.url else {
            return
        }
        print(url)
        guard let code = URLComponents(string: url.absoluteString)?.queryItems?.first(where: { $0.name == "code"  })?.value else {
            return
        }
        webView.isHidden = true

        SpotifyAuthManager.shared.exchangeCodeForToken(code: code) { success in
            DispatchQueue.main.async {
                let vc = TapBarViewController()
                vc.modalPresentationStyle = .fullScreen
                self.navigationController?.present(vc, animated: true)
                
            }
        }

    }
    


}
