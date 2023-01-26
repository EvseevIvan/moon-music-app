//
//  TapBarViewController.swift
//  Moon Music App
//
//  Created by Иван Евсеев on 09.01.2023.
//

import UIKit
import AVFoundation

class TapBarViewController: UITabBarController, PlayerDelegate {
    func playMusic(album: Album, indexPath: IndexPath) {
        player.configure(with: album, indexPath: indexPath)
    }
    
    
    var audioPlayer: AVAudioPlayer!
    
    var player: Player = {
        let player = Player()
        player.translatesAutoresizingMaskIntoConstraints = false
        return player
    }()
    
//    var playerView: UIView = {
//        let view = UIView()
//        view.addBlur(style: .dark)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    var openPlayerButton: UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//        return button
//    }()
//
//    var playerImage: UIImageView = {
//        let image = UIImageView()
//        image.translatesAutoresizingMaskIntoConstraints = false
//        image.image = UIImage(systemName: "heart.fill")
//        return image
//    }()
//    
//    var playMusicButton: UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
//        button.addTarget(self, action: #selector(playAudioButtonTapped), for: .touchUpInside)
//        return button
//    }()
    
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
//        view.addSubview(playerView)
        
//        playerView.addSubview(playerImage)
//        playerView.addSubview(openPlayerButton)
//        playerView.addSubview(playMusicButton)


        NSLayoutConstraint.activate([
            
            player.widthAnchor.constraint(equalToConstant: view.frame.width),
            player.heightAnchor.constraint(equalToConstant: 70),
            player.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            player.centerXAnchor.constraint(equalTo: view.centerXAnchor),

//            playerView.widthAnchor.constraint(equalToConstant: view.frame.width),
//            playerView.heightAnchor.constraint(equalToConstant: 70),
//            playerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
//            playerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//
//            playerImage.widthAnchor.constraint(equalToConstant: 30),
//            playerImage.heightAnchor.constraint(equalToConstant: 30),
//            playerImage.centerXAnchor.constraint(equalTo: playerView.centerXAnchor),
//            playerImage.centerYAnchor.constraint(equalTo: playerView.centerYAnchor),
//
//            openPlayerButton.topAnchor.constraint(equalTo: playerView.topAnchor),
//            openPlayerButton.bottomAnchor.constraint(equalTo: playerView.bottomAnchor),
//            openPlayerButton.trailingAnchor.constraint(equalTo: playerView.trailingAnchor, constant: -40),
//            openPlayerButton.leadingAnchor.constraint(equalTo: playerView.leadingAnchor),
//
//            playMusicButton.centerYAnchor.constraint(equalTo: playerView.centerYAnchor),
//            playMusicButton.widthAnchor.constraint(equalToConstant: 30),
//            playMusicButton.heightAnchor.constraint(equalToConstant: 30),
//            playMusicButton.trailingAnchor.constraint(equalTo: playerView.trailingAnchor, constant: -10)


        ])

    }
    
    @objc func playAudioButtonTapped(sender: UIButton) {
        
//        NetworkManager().getTrack1 { url1 in
//            if sender.currentImage == UIImage(systemName: "play.fill") {
//                sender.setImage(UIImage(systemName: "pause.fill"), for: .normal)
//                if url1 != nil {
//                    let url = URL(string: url1 ?? "")
//                    self.downloadFileFromURL(url: url!)
//                }
//
//
//            } else {
//                sender.setImage(UIImage(systemName: "pause.fill"), for: .normal)
//                self.audioPlayer.stop()
//            }
//        }
    }

    func downloadFileFromURL(url: URL){
        var downloadTask:URLSessionDownloadTask
        downloadTask = URLSession.shared.downloadTask(with: url) { (url1, response, error) in
            self.play(url: url1!)
        }
        downloadTask.resume()
    }
    
    func play(url:URL) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url as URL)
            audioPlayer.prepareToPlay()
            audioPlayer.volume = 2.0
            audioPlayer.play()
        } catch let error as NSError {
            print(error.localizedDescription)
        } catch {
            print("AVAudioPlayer init failed")
        }
        
    }
    
//    func playMusic(url: String) {
//        let downloadUrl = URL(string: url)
//        self.downloadFileFromURL(url: downloadUrl!)
//        if playMusicButton.currentImage == UIImage(systemName: "play.fill") {
//            playMusicButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
//        }
//    }

}
