//
//  Player.swift
//  Moon Music App
//
//  Created by Иван Евсеев on 26.01.2023.
//

import Foundation
import UIKit
import SDWebImage

protocol PlayerDelegate: NSObject {
    func playMusic(album: Album, indexPath: IndexPath)
}

class Player: UIView {
        
    var playerView: UIView = {
        let view = UIView()
        view.addBlur(style: .dark)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var openPlayerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var playerImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "heart.fill")
        return image
    }()
    
    var nameOfTrack: UILabel = {
        let label = UILabel()
        label.text = "LLLLL"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    var nameOfArist: UILabel = {
        let label = UILabel()
        label.text = "AAAAAA"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .white
        return label
    }()
    
    var playMusicButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
//        button.addTarget(self, action: #selector(playAudioButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func layoutSubviews(){
        super.layoutSubviews()
        setupConstraints()
    }
        
    func configure(with album: Album, indexPath: IndexPath) {
        self.nameOfTrack.text = album.tracks.items[indexPath.row].name
        self.nameOfArist.text = album.tracks.items[indexPath.row].artists[0].name
        let url = URL(string: album.images[0].url)
        self.playerImage.sd_setImage(with: url)
        self.playerImage.sd_imageIndicator = SDWebImageActivityIndicator.white
    }
    
    func setupConstraints() {
        
        self.addSubview(playerView)
        
        playerView.addSubview(playerImage)
        playerView.addSubview(openPlayerButton)
        playerView.addSubview(playMusicButton)
        playerView.addSubview(nameOfTrack)
        playerView.addSubview(nameOfArist)



        NSLayoutConstraint.activate([


            playerView.widthAnchor.constraint(equalToConstant: self.frame.width),
            playerView.heightAnchor.constraint(equalToConstant: self.frame.height),
            playerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            playerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            playerImage.widthAnchor.constraint(equalToConstant: 30),
            playerImage.heightAnchor.constraint(equalToConstant: 30),
            playerImage.leadingAnchor.constraint(equalTo: playerView.leadingAnchor),
            playerImage.centerYAnchor.constraint(equalTo: playerView.centerYAnchor),
            
//            nameOfTrack.leadingAnchor.constraint(equalTo: playerImage.trailingAnchor),
//            nameOfTrack.centerYAnchor.constraint(equalTo: playerImage.centerYAnchor),
//            nameOfTrack.widthAnchor.constraint(equalToConstant: 100),
//            nameOfTrack.heightAnchor.constraint(equalToConstant: 20),
            
            nameOfArist.leadingAnchor.constraint(equalTo: playerImage.trailingAnchor, constant: 10),
            nameOfArist.centerXAnchor.constraint(equalTo: playerView.centerXAnchor, constant: -20),
            nameOfArist.widthAnchor.constraint(equalToConstant: 100),
            nameOfArist.heightAnchor.constraint(equalToConstant: 20),

            openPlayerButton.topAnchor.constraint(equalTo: playerView.topAnchor),
            openPlayerButton.bottomAnchor.constraint(equalTo: playerView.bottomAnchor),
            openPlayerButton.trailingAnchor.constraint(equalTo: playerView.trailingAnchor, constant: -40),
            openPlayerButton.leadingAnchor.constraint(equalTo: playerView.leadingAnchor),
            
            playMusicButton.centerYAnchor.constraint(equalTo: playerView.centerYAnchor),
            playMusicButton.widthAnchor.constraint(equalToConstant: 30),
            playMusicButton.heightAnchor.constraint(equalToConstant: 30),
            playMusicButton.trailingAnchor.constraint(equalTo: playerView.trailingAnchor, constant: -10)
            
            


        ])

    }
    
    
}

