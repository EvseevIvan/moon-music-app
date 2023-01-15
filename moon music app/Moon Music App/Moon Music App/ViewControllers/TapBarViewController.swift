//
//  TapBarViewController.swift
//  Moon Music App
//
//  Created by Иван Евсеев on 09.01.2023.
//

import UIKit

class TapBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainVC = MainViewController()
        let playerVC = PlayerViewController()
        let searchVC = SearchViewController()
        let libraryVC = LibraryViewController()
        let profileVC = ProfileViewController()
        
        mainVC.title = "Main"
        playerVC.title = "Player"
        searchVC.title = "Search"
        libraryVC.title = "Library"
        profileVC.title = "Profile"
        
        mainVC.navigationItem.largeTitleDisplayMode = .always
        playerVC.navigationItem.largeTitleDisplayMode = .always
        searchVC.navigationItem.largeTitleDisplayMode = .always
        libraryVC.navigationItem.largeTitleDisplayMode = .always
        profileVC.navigationItem.largeTitleDisplayMode = .always
        
        mainVC.tabBarItem = UITabBarItem(title: "Main", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: ""))
        playerVC.tabBarItem = UITabBarItem(title: "Player", image: UIImage(systemName: "play.circle"), selectedImage: UIImage(systemName: ""))
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: ""))
        libraryVC.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "music.note.list"), selectedImage: UIImage(systemName: ""))
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), selectedImage: UIImage(systemName: ""))
        
        let mainNavigationController = UINavigationController(rootViewController: mainVC)
        let playerNavigationController = UINavigationController(rootViewController: playerVC)
        let searchNavigationController = UINavigationController(rootViewController: searchVC)
        let libraryNavigationController = UINavigationController(rootViewController: libraryVC)
        let profileNavigationController = UINavigationController(rootViewController: profileVC)
        
        
        mainNavigationController.navigationBar.prefersLargeTitles = true
        playerNavigationController.navigationBar.prefersLargeTitles = true
        searchNavigationController.navigationBar.prefersLargeTitles = true
        libraryNavigationController.navigationBar.prefersLargeTitles = true
        profileNavigationController.navigationBar.prefersLargeTitles = true
        
        setViewControllers([mainVC, playerVC, searchVC, libraryVC, profileVC], animated: false)

    }
    

}
