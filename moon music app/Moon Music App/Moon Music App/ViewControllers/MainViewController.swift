//
//  ViewController.swift
//  Moon Music App
//
//  Created by Иван Евсеев on 09.01.2023.
//

import UIKit


class MainViewController: UIViewController {
    
    let viewModel = MainViewModel()
    
    lazy var collectionView = UICollectionView()
    
    var backImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "backImage")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    weak var delegate: PlayerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.frame.size.width/3, height: view.frame.size.height/3)
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        
        collectionView.register(NewAlbumCollectionViewCell.self, forCellWithReuseIdentifier: NewAlbumCollectionViewCell.identifier)
        
        
        
        collectionView.frame = view.bounds
        viewModel.getTrack() {
            self.collectionView.reloadData()
        }
        
    }
    
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            setupConstraints()
        }
    
        func setupConstraints() {
    
            view.addSubview(backImage)
            view.addSubview(collectionView)

    
    
            NSLayoutConstraint.activate([
    
    
                backImage.topAnchor.constraint(equalTo: view.topAnchor),
                backImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                backImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                backImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),

    
            ])
    
        }
    

    


}
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.album?.tracks.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewAlbumCollectionViewCell.identifier, for: indexPath) as! NewAlbumCollectionViewCell
        guard let album = viewModel.album else { return UICollectionViewCell() }
        cell.configure(with: album, indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let album = viewModel.album else { return }
        playingAlbum = album
        playingTrack = playingAlbum?.tracks.items[indexPath.row]
        delegate?.configurePlayer(album: album, track: playingTrack!)
        
    }
    
    
}

extension UIView {
    func addBlur(style: UIBlurEffect.Style) {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
    }
}
