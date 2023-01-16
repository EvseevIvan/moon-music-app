//
//  AuthModel.swift
//  Moon Music App
//
//  Created by Иван Евсеев on 15.01.2023.
//

import Foundation


struct AccessToken: Codable {
    let accessToken, tokenType: String
    let expiresIn: Int
    let refreshToken, scope: String

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case refreshToken = "refresh_token"
        case scope
    }
}
