//
//  API.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 06/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


// MARK: - Configuration

struct Configuration {

    static let baseURLString = "https://ws.audioscrobbler.com/2.0/"
    static let apiKey = "foobar"
}


// MARK: - URLConvertible

protocol URLConvertible {

    func url() -> URL?
}


// MARK: - APIEndpoint

enum APIEndpoint {

    case getTopArtists(Int)
    case getTopAlbums(String, Int)
}


// MARK: - URLConvertible

extension APIEndpoint: URLConvertible {

    func url() -> URL? {

        switch self {

        case .getTopArtists(let limit):

            let method = "chart.gettopartists"

            return URL(string: "\(Configuration.baseURLString)?method=\(method)&api_key=\(Configuration.apiKey)&format=json&limit=\(limit)")

        case .getTopAlbums(let artistId, let limit):

            let method = "artist.gettopalbums"

            return URL(string: "\(Configuration.baseURLString)?method=\(method)&api_key=\(Configuration.apiKey)&mbid=\(artistId)&format=json&limit=\(limit)")
        }
    }
}
