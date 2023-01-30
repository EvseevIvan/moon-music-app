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
        image.image = UIImage(systemName: "heart.fill")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
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

        NSLayoutConstraint.activate([

            imageOfTrack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageOfTrack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageOfTrack.widthAnchor.constraint(equalToConstant: 200),
            imageOfTrack.heightAnchor.constraint(equalToConstant: 200),

            playMusicButton.widthAnchor.constraint(equalToConstant: 100),
            playMusicButton.heightAnchor.constraint(equalToConstant: 100),
            playMusicButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            playMusicButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            


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
    }
    
    



}
