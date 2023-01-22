//
//  TapBarViewController.swift
//  Moon Music App
//
//  Created by Иван Евсеев on 09.01.2023.
//

import UIKit

class TapBarViewController: UITabBarController {

    var playerView: UIView = {
        let view = UIView()
        view.addBlur(style: .dark)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var openPlayerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    var playerImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "heart.fill")
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainVC = MainViewController()
        let searchVC = SearchViewController()
        let libraryVC = LibraryViewController()
        let profileVC = ProfileViewController()
       
        let navMainVC = UINavigationController(rootViewController: mainVC)
        let navSearchVC = UINavigationController(rootViewController: searchVC)
        let navLibraryVC = UINavigationController(rootViewController: libraryVC)
        let navProfileVC = UINavigationController(rootViewController: profileVC)

        
        mainVC.title = "Main"
        searchVC.title = "Search"
        libraryVC.title = "Library"
        profileVC.title = "Profile"
        
        mainVC.navigationItem.largeTitleDisplayMode = .always
        searchVC.navigationItem.largeTitleDisplayMode = .always
        libraryVC.navigationItem.largeTitleDisplayMode = .always
        profileVC.navigationItem.largeTitleDisplayMode = .always
        
        mainVC.tabBarItem = UITabBarItem(title: "Main", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: ""))
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: ""))
        libraryVC.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "music.note.list"), selectedImage: UIImage(systemName: ""))
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), selectedImage: UIImage(systemName: ""))
        

        
        
        navMainVC.navigationBar.prefersLargeTitles = true
        navSearchVC.navigationBar.prefersLargeTitles = true
        navLibraryVC.navigationBar.prefersLargeTitles = true
        navProfileVC.navigationBar.prefersLargeTitles = true
        
        setViewControllers([navMainVC, navSearchVC, navLibraryVC, navProfileVC], animated: false)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupConstraints()
    }
    
    @objc func buttonAction(sender: UIButton!) {
        let vc = PlayerViewController()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
       }
    
    
    func setupConstraints() {

        view.addSubview(playerView)
        
        playerView.addSubview(playerImage)
        playerView.addSubview(openPlayerButton)



        NSLayoutConstraint.activate([


            playerView.widthAnchor.constraint(equalToConstant: view.frame.width),
            playerView.heightAnchor.constraint(equalToConstant: 70),
            playerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            playerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            playerImage.widthAnchor.constraint(equalToConstant: 30),
            playerImage.heightAnchor.constraint(equalToConstant: 30),
            playerImage.centerXAnchor.constraint(equalTo: playerView.centerXAnchor),
            playerImage.centerYAnchor.constraint(equalTo: playerView.centerYAnchor),

            openPlayerButton.topAnchor.constraint(equalTo: playerView.topAnchor),
            openPlayerButton.bottomAnchor.constraint(equalTo: playerView.bottomAnchor),
            openPlayerButton.trailingAnchor.constraint(equalTo: playerView.trailingAnchor),
            openPlayerButton.leadingAnchor.constraint(equalTo: playerView.leadingAnchor)


        ])

    }

}
