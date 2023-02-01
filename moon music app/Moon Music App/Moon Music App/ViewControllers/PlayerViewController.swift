//
//  PlayerViewController.swift
//  Moon Music App
//
//  Created by Иван Евсеев on 09.01.2023.
//

import UIKit
import AVFoundation
import SDWebImage

class PlayerViewController: UIViewController {

    var viewTranslation = CGPoint(x: 0, y: 0)
    var playMusicButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("LSDLSJDLKGJLSKFJGLK", for: .normal)
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.addTarget(self, action: #selector(playAudioButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var imageOfTrack: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        image.image = UIImage(systemName: "heart.fill")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var nameOfTrack: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "DAFLJSFLJDSLKJ"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    var nameOfArist: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .white
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addBlur(style: .dark)
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleDismiss)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configure(album: playingNow!)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupConstraints()
    }
    
    func setupConstraints() {

        view.addSubview(playMusicButton)
        view.addSubview(imageOfTrack)
        view.addSubview(nameOfArist)
        view.addSubview(nameOfTrack)

        NSLayoutConstraint.activate([

            imageOfTrack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageOfTrack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -160),
            imageOfTrack.widthAnchor.constraint(equalToConstant: view.frame.width - 60),
            imageOfTrack.heightAnchor.constraint(equalToConstant: view.frame.width - 60),

            playMusicButton.widthAnchor.constraint(equalToConstant: 100),
            playMusicButton.heightAnchor.constraint(equalToConstant: 100),
            playMusicButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            playMusicButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nameOfTrack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nameOfTrack.topAnchor.constraint(equalTo: imageOfTrack.bottomAnchor, constant: 30),
            nameOfTrack.widthAnchor.constraint(equalToConstant: 170),
            nameOfTrack.heightAnchor.constraint(equalToConstant: 30),
            
            nameOfArist.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nameOfArist.topAnchor.constraint(equalTo: nameOfTrack.bottomAnchor),
            nameOfArist.widthAnchor.constraint(equalToConstant: 170),
            nameOfArist.heightAnchor.constraint(equalToConstant: 30)


        ])

    }
    

    @objc func handleDismiss(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .changed:
            viewTranslation = sender.translation(in: view)
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 10, options: .curveEaseOut, animations: {
                self.view.transform = CGAffineTransform(translationX: 0, y: self.viewTranslation.y)
            })
        case .ended:
            if viewTranslation.y < 200 {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.view.transform = .identity
                })
            } else {
                dismiss(animated: true, completion: nil)
            }
        default:
            break
        }
    }
    
    @objc func playAudioButtonTapped(sender: UIButton) {
        
    }
    
    func configure(album: Album) {
        print(album.images[0].url)
        let url = URL(string: album.images[0].url)
        self.imageOfTrack.sd_setImage(with: url)
        self.imageOfTrack.sd_imageIndicator = SDWebImageActivityIndicator.white
        if AudioPlayer.shared.audioPlayer.isPlaying {
            playMusicButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        } else {
            playMusicButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        }
        self.nameOfTrack.text = album.tracks.items[0].name
        self.nameOfArist.text = album.artists[0].name
    }
    
    



}
