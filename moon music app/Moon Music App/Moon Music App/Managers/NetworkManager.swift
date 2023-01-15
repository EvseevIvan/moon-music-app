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
    
//    func getToken(clientID: String, redirectURL: String, scopes: String, completition: @escaping (String) -> Void) {
//
//
//        let genresRequest = AF.request("https://accounts.spotify.com/authorize?response_type=code&client_id=\(clientID)&scope=\(scopes)&redirect_uri=\(redirectURL)&show_dialog=TRUE", method: .get)
//
//        genresRequest.response { response in
//            do {
//                let data = try response.result.get()
//                let url = String(decoding: data!, as: UTF8.self)
//                completition(url)
//
//            }
//            catch {
//                print("error: \(error)")
//            }
//        }
//    }
  
    
//    func getAccessToken(code: String, redirectURL: String, grantType: String, completion: @escaping () -> Void) {
//        let genresRequest = AF.request("https://accounts.spotify.com/api/token?grant_type=\(grantType)&code=\(code)&redirect_uri=\(redirectURL)", method: .post)
//        genresRequest.response { response in
//            do {
//                let data = try response.result.get()
//                completion()
//            }
//            catch {
//                print("error: \(error)")
//            }
//        }
//    }
    
    func getAccessToken(code: String, redirectURL: String, grantType: String, completion: @escaping (SpotifyAuthResponse) -> Void) {
        let userParams: Parameters = [
            "grant_type": grantType,
            "code": code,
            "redirect_uri": redirectURL
        ]
        let genresRequest = AF.request("https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=de2fa60445b65225004497a21552b0ce", method: .post, parameters: userParams, headers: nil)
        genresRequest.responseDecodable(of: SpotifyAuthResponse.self) { response in
            do {

                let data = try response.result.get()
                completion(data)

            }
            catch {
                print("error: \(error)")
            }
        }
    }
    
}
