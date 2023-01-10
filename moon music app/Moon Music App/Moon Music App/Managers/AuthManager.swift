//
//  AuthManager.swift
//  Moon Music App
//
//  Created by Иван Евсеев on 10.01.2023.
//

import Foundation

class AuthManager {
    
    struct Constants {
        static let clientID = "39c7757d887d42c188800b0054d32bf1"
        static let clientSecret = "5c9893f7c5b84699b5e74befd66658a8"
    }
    
    public var signInURL: URL? {
        let scopes = "user-read-private"
        let redirectURI = "https://github.com/EvseevIvan"
        let base = "https://accounts.spotify.com/authorize"
        let url = "\(base)?response_type=code&client_id=\(Constants.clientID)&scope=\(scopes)&redirect_uri=\(redirectURI)&show_dialog=TRUE"
        return URL(string: url)
    }
    
    static let shared = AuthManager()
    
    private init() {}
    
    var isSignedIn: Bool {
        return false
    }
    
    var accessToken: String? {
        return nil
    }
    
    var refreshToken: String? {
        return nil
    }
    
    var tokenExpirationDate: Date? {
        return nil
    }
    var shouldRefreshToken: Bool {
        return false
    }
}
