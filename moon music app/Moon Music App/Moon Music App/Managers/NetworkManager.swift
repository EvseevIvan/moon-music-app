//
//  NetworkManager.swift
//  Moon Music App
//
//  Created by Иван Евсеев on 14.01.2023.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static var shared = NetworkManager()
    
    func getAccessToken(code: String, redirectURL: String, grantType: String, completion: @escaping (String) -> Void) {
        let userParams: Parameters = [
            "grant_type": grantType,
            "code": code,
            "redirect_uri": redirectURL
        ]
        
        let headers: HTTPHeaders = [
          "Authorization": "Basic MzljNzc1N2Q4ODdkNDJjMTg4ODAwYjAwNTRkMzJiZjE6NWM5ODkzZjdjNWI4NDY5OWI1ZTc0YmVmZDY2NjU4YTg",
          "Content-Type": "application/x-www-form-urlencoded"
        ]
        
        let genresRequest = AF.request("https://accounts.spotify.com/api/token", method: .post, parameters: userParams, headers: headers)
        
        genresRequest.responseDecodable(of: AccessToken.self) { response in
            do {

                let data = try response.result.get().accessToken
                completion(data)

            }
            catch {
                print("error: \(error)")
            }
        }
    }
    
    func getNewReleases(accessToken: String, completion: @escaping ([Item]) -> Void) {

        let headers: HTTPHeaders = [
          "Content-Type": "application/json",
          "Authorization": "Bearer \(accessToken)"
        ]

        let genresRequest = AF.request("https://api.spotify.com/v1/browse/new-releases", method: .get, headers: headers)

        genresRequest.responseDecodable(of: NewAlbums.self) { response in
            do {
                var newAlbums: [Item] = []
                newAlbums = try response.result.get().albums.items
                completion(newAlbums)

            }
            catch {
                print("error: \(error)")
            }
        }
    }
    
    
}
