//
//  AuthModel.swift
//  Moon Music App
//
//  Created by Иван Евсеев on 15.01.2023.
//

import Foundation

public struct SpotifyAuthResponse: Codable, Equatable {
    let access_token: String
    let expires_in: Int
    let refresh_token: String?
    let scope: String
    let token_type: String
}
