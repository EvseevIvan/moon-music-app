//
//  AuthViewModel.swift
//  Moon Music App
//
//  Created by Иван Евсеев on 14.01.2023.
//

import Foundation


class AuthViewModel {
    
    let clientID = "39c7757d887d42c188800b0054d32bf1"
    let clientSecret = "5c9893f7c5b84699b5e74befd66658a8"
    let redirectURL = "https://github.com/EvseevIvan"
    var accessToken = ""
    
    public var signInURL: URL? {
        let scopes = "user-read-private"
        let redirectURI = "https://github.com/EvseevIvan"
        let base = "https://accounts.spotify.com/authorize"
        let url = "\(base)?response_type=code&client_id=\(clientID)&scope=\(scopes)&redirect_uri=\(redirectURI)&show_dialog=TRUE"
        return URL(string: url)
    }
    
    
    func getAccessToken(code: String, redirectURL: String, grantType: String, completion: @escaping (String) -> Void) {
        NetworkManager.shared.getAccessToken(code: code, redirectURL: redirectURL, grantType: grantType) { token in
            self.accessToken = token
            completion(token)
        }
    }
    

    
}
