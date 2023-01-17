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

    let viewModel = AuthViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        webView.navigationDelegate = self
        view.addSubview(webView)

        let url = viewModel.signInURL
        self.webView.load(URLRequest(url: url!))

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        guard let url = webView.url else {
            return
        }
        
        guard let code = URLComponents(string: url.absoluteString)?.queryItems?.first(where: { $0.name == "code"  })?.value else {
            return
        }
        webView.isHidden = true
    
        
        viewModel.getAccessToken(code: code, redirectURL: redirectURL, grantType: "authorization_code") { token in
            print(token)
            accessToken = token
            let vc = TapBarViewController()
            vc.modalPresentationStyle = .fullScreen
            self.navigationController?.present(vc, animated: true)
//            NetworkManager().getTopArtists(accessToken: token) {
//
//            }
        }
        
    }
    


}
