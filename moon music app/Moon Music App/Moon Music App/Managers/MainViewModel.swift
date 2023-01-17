//
//  MainViewModel.swift
//  Moon Music App
//
//  Created by Иван Евсеев on 17.01.2023.
//

import Foundation


class MainViewModel {
    
    var newAlbums: [Item] = []
    
    func getNewReleases(accessToken: String, completion: @escaping ([Item]) -> Void) {
        NetworkManager.shared.getNewReleases(accessToken: accessToken) { newAlbums in
            completion(newAlbums)
        }
    }
    
}
