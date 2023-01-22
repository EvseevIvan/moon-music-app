//
//  MainViewModel.swift
//  Moon Music App
//
//  Created by Иван Евсеев on 17.01.2023.
//

import Foundation


class MainViewModel {
    
    var newAlbums1: [Item] = []
    
    func getNewReleases(accessToken: String, completion: @escaping () -> Void) {
        NetworkManager.shared.getNewReleases(accessToken: accessToken) { newAlbums in
            self.newAlbums1 = newAlbums
            completion()
        }
    }
    
}
