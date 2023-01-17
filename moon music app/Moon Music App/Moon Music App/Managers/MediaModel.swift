//
//  mediaModel.swift
//  Moon Music App
//
//  Created by Иван Евсеев on 17.01.2023.
//

import Foundation






// MARK: - Welcome
struct NewAlbums: Codable {
    let albums: Albums
}

// MARK: - Albums
struct Albums: Codable {
    let href: String
    let items: [Item]
    let limit: Int
    let next: String
    let offset: Int
    let previous: JSONNull?
    let total: Int
}

// MARK: - Item
struct Item: Codable {
    let albumType: AlbumTypeEnum
    let artists: [Artist]
    let availableMarkets: [String]
    let externalUrls: ExternalUrls
    let href: String
    let id: String
    let images: [Image]
    let name, releaseDate: String
    let releaseDatePrecision: ReleaseDatePrecision
    let totalTracks: Int
    let type: AlbumTypeEnum
    let uri: String

    enum CodingKeys: String, CodingKey {
        case albumType = "album_type"
        case artists
        case availableMarkets = "available_markets"
        case externalUrls = "external_urls"
        case href, id, images, name
        case releaseDate = "release_date"
        case releaseDatePrecision = "release_date_precision"
        case totalTracks = "total_tracks"
        case type, uri
    }
}

enum AlbumTypeEnum: String, Codable {
    case album = "album"
    case single = "single"
}

// MARK: - Artist
struct Artist: Codable {
    let externalUrls: ExternalUrls
    let href: String
    let id, name: String
    let type: ArtistType
    let uri: String

    enum CodingKeys: String, CodingKey {
        case externalUrls = "external_urls"
        case href, id, name, type, uri
    }
}

// MARK: - ExternalUrls
struct ExternalUrls: Codable {
    let spotify: String
}

enum ArtistType: String, Codable {
    case artist = "artist"
}

// MARK: - Image
struct Image: Codable {
    let height: Int
    let url: String
    let width: Int
}

enum ReleaseDatePrecision: String, Codable {
    case day = "day"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
