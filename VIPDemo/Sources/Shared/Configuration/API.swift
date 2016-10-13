//
//  API.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 06/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


// MARK: - LastFMAPI

/// _LastFMAPI_ is a struct responsible for general Last FM API configurations
struct LastFMAPI {

    static let baseURLString = "https://ws.audioscrobbler.com/2.0/"
    static let apiKey = "foobar"
}


// MARK: - URLConvertible

/// _URLConvertible_ is a protocol to implement urls
protocol URLConvertible {

    func url() -> URL?
}


// MARK: - LastFMAPIEndpoint

/// _LastFMAPIEndpoint_ is an enumeration of all Last FM types of API requests
///
/// - getTopArtists: The get top artists request
/// - getTopAlbums:  The get top albums request
enum LastFMAPIEndpoint {

    case getTopArtists(Int)
    case getTopAlbums(String, Int)
}


// MARK: - URLConvertible

extension LastFMAPIEndpoint: URLConvertible {

    func url() -> URL? {

        switch self {

        case .getTopArtists(let limit):

            let method = "chart.gettopartists"

            return URL(string: "\(LastFMAPI.baseURLString)?method=\(method)&api_key=\(LastFMAPI.apiKey)&format=json&limit=\(limit)")

        case .getTopAlbums(let artistId, let limit):

            let method = "artist.gettopalbums"

            return URL(string: "\(LastFMAPI.baseURLString)?method=\(method)&api_key=\(LastFMAPI.apiKey)&mbid=\(artistId)&format=json&limit=\(limit)")
        }
    }
}
