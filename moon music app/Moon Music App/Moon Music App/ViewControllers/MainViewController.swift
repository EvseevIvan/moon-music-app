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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        
        viewModel.getNewReleases(accessToken: accessToken) { newAlbums in
            self.viewModel.newAlbums = newAlbums
        }

    }


}

