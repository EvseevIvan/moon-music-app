//
//  SpotifyManager.swift
//  Moon Music App
//
//  Created by Иван Евсеев on 12.01.2023.
//

import Foundation
import Spotify_Kit

let spotifyManager = SpotifyManager(with:
    SpotifyManager.SpotifyDeveloperApplication(
        clientId:     "39c7757d887d42c188800b0054d32bf1",
        clientSecret: "5c9893f7c5b84699b5e74befd66658a8",
        redirectUri:  "https://github.com/EvseevIvan"
    )
)

