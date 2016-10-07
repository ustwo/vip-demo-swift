//
//  API.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 06/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


// MARK: - APIConstants

struct APIConstants {

    static let baseURLString = "https://ws.audioscrobbler.com/2.0/"
    static let apiKey = "79f867d148b0f1598e7ed8541262c17b"
}


// MARK: - URLConvertible

protocol URLConvertible {

    func url() -> URL?
}


// MARK: - APIEndpoint

enum APIEndpoint {

    case getTopArtists(Int)
}


// MARK: - URLConvertible

extension APIEndpoint: URLConvertible {

    func url() -> URL? {

        switch self {

        case .getTopArtists(let limit):

            let method = "chart.gettopartists"

            return URL(string: "\(APIConstants.baseURLString)?method=\(method)&api_key=\(APIConstants.apiKey)&format=json&limit=\(limit)")
        }
    }
}
