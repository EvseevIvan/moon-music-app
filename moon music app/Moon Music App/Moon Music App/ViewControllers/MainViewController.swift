//
//  ViewController.swift
//  Moon Music App
//
//  Created by Иван Евсеев on 09.01.2023.
//

import UIKit
import Spotify_Kit
class MainViewController: UIViewController {
    

    let viewModel = MainViewModel()
    var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.frame.size.width/3, height: view.frame.size.height/3)
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")

        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        view.addSubview(collectionView!)

        collectionView?.register(NewAlbumCollectionViewCell.self, forCellWithReuseIdentifier: NewAlbumCollectionViewCell.identifier)

        
        collectionView?.frame = view.bounds
        viewModel.getNewReleases(accessToken: accessToken) { albums in
            self.viewModel.newAlbums = albums
        }

    }


}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.newAlbums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewAlbumCollectionViewCell.identifier, for: indexPath) as! NewAlbumCollectionViewCell
        cell.configure(with: viewModel.newAlbums[indexPath.row])
        return cell
    }
    
    
}
