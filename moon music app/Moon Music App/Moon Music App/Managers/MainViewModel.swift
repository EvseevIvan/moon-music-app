//
//  MainViewModel.swift
//  Moon Music App
//
//  Created by Иван Евсеев on 17.01.2023.
//

import Foundation


class MainViewModel {
    
    var album: Album?
    
    
    func getTrack(completion: @escaping () -> Void) {
        NetworkManager.shared.getAlbum() { album in
            self.album = album
            completion()
        }
    }
    
    
    
}
