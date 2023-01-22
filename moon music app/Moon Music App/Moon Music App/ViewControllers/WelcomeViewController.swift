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
        signInButton.backgroundColor = UIColor(red: 0.657, green: 0.381, blue: 1, alpha: 1)
        signInButton.layer.cornerRadius = 25
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Sign In", for: .normal)
        return signInButton
    }()
    
    var backImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "backImage")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        view.addSubview(signInButton)
        signInButton.addTarget(self, action: #selector(signInPressed), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupConstraints()
    }
    
    func setupConstraints() {
        
        view.addSubview(backImage)
        view.addSubview(signInButton)

        
        NSLayoutConstraint.activate([

            
            backImage.topAnchor.constraint(equalTo: view.topAnchor),
            backImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),

            signInButton.widthAnchor.constraint(equalToConstant: 350),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
            signInButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            

            
            
        ])
        
    }
    
    @objc func signInPressed() {
        let vc = AuthenticationViewController()
        self.signInButton.window?.rootViewController = UINavigationController(rootViewController: vc)
    }
}
