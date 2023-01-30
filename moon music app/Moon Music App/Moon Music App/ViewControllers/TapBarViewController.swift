//
//  TapBarViewController.swift
//  Moon Music App
//
//  Created by Иван Евсеев on 09.01.2023.
//

import UIKit
import AVFoundation

class TapBarViewController: UITabBarController, PlayerDelegate {
    func configurePlayer(album: Album, indexPath: IndexPath) {
        player.configure(with: album, indexPath: indexPath)
    }
    
    
    
    var audioPlayer: AVAudioPlayer!
    
    var player: Player = {
        let player = Player()
        player.translatesAutoresizingMaskIntoConstraints = false
        player.openPlayerButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return player
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let mainVC = MainViewController()
        let searchVC = SearchViewController()
        let libraryVC = LibraryViewController()
        let profileVC = ProfileViewController()
        
        mainVC.delegate = self
       
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

        view.addSubview(player)



        NSLayoutConstraint.activate([
            
            player.widthAnchor.constraint(equalToConstant: view.frame.width),
            player.heightAnchor.constraint(equalToConstant: 70),
            player.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            player.centerXAnchor.constraint(equalTo: view.centerXAnchor),



        ])

    }
    
    @objc func playAudioButtonTapped(sender: UIButton) {
        

    }



}
