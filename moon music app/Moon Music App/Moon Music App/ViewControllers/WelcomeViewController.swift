//
//  WelcomeViewController.swift
//  Moon Music App
//
//  Created by Иван Евсеев on 09.01.2023.
//

import UIKit

class WelcomeViewController: UIViewController {

    @objc let signInButton: UIButton = {
        let signInButton = UIButton()
        signInButton.setTitle("Log in with Spotify", for: .normal)
        return signInButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        view.addSubview(signInButton)
        signInButton.addTarget(self, action: #selector(signInPressed), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signInButton.frame = CGRect(x: 20, y: 100, width: 200, height: 50)
    }
    
    @objc func signInPressed() {
        let vc = AuthenticationViewController()
        self.signInButton.window?.rootViewController = UINavigationController(rootViewController: vc)
    }
}
