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
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.addTarget(self, action: #selector(playAudioButtonTapped), for: .touchUpInside)
        button.tintColor = .white
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
    
    var slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.setValue(0, animated: false)
        slider.minimumTrackTintColor = .green
        slider.minimumTrackTintColor = .red
        slider.thumbTintColor = .black
        slider.addTarget(self, action: #selector(changeAudioTime), for: .valueChanged)
        return slider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addBlur(style: .dark)
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleDismiss)))
        
        _ = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configure(album: playingAlbum!, track: playingTrack!)
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
        view.addSubview(slider)

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
            nameOfArist.heightAnchor.constraint(equalToConstant: 30),
            
            slider.widthAnchor.constraint(equalToConstant: view.frame.width - 60),
            slider.heightAnchor.constraint(equalToConstant: 20),
            slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            slider.topAnchor.constraint(equalTo: nameOfArist.bottomAnchor, constant: 30)


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
        
        if playMusicButton.currentImage == UIImage(systemName: "pause.fill") {
            AudioPlayer.shared.audioPlayer.stop()
            playMusicButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            TapBarViewController().player.playMusicButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        } else {
            AudioPlayer.shared.audioPlayer.play()
            playMusicButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            TapBarViewController().player.playMusicButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
    }
    
    @objc func changeAudioTime(sender: UISlider) {
        AudioPlayer.shared.audioPlayer.stop()
        AudioPlayer.shared.audioPlayer.currentTime = TimeInterval(slider.value)
        AudioPlayer.shared.audioPlayer.prepareToPlay()
        AudioPlayer.shared.audioPlayer.play()
    }
    
    @objc func updateSlider(sender: UISlider) {
        slider.value = Float(AudioPlayer.shared.audioPlayer.currentTime)
    }
    
    func configure(album: Album, track: Track) {
        let url = URL(string: album.images[0].url)
        self.imageOfTrack.sd_setImage(with: url)
        self.imageOfTrack.sd_imageIndicator = SDWebImageActivityIndicator.white
        if AudioPlayer.shared.audioPlayer.isPlaying {
            playMusicButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        } else {
            playMusicButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        }
        self.nameOfTrack.text = track.name
        self.nameOfArist.text = track.artists[0].name
    }
    
    



}
