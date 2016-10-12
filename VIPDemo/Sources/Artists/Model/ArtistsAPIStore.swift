//
//  ArtistsAPIStore.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 06/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


// MARK: - ArtistsAPIStore

/// _ArtistsAPIStore_ is a class responsible for fetching artists
final class ArtistsAPIStore {

    fileprivate struct Constants {
        static let topArtistsLimit = 50
        static let topArtistsDictionaryKey = "artists"
        static let topArtistsArrayKey = "artist"
    }

    fileprivate let networkClient: NetworkClientProtocol


    // MARK: - Initializers

    /// Initializes an instance of _ArtistsAPIStore_ with an object that conforms to the protocol _NetworkClientProtocol_
    ///
    /// - parameter networkClient: The object to be used to send requests to the API
    ///
    /// - returns: The instance of _ArtistsAPIStore_
    init(networkClient: NetworkClientProtocol = NetworkClient.sharedInstance) {

        self.networkClient = networkClient
    }
}


// MARK: - ArtistsStoreProtocol

extension ArtistsAPIStore: ArtistsStoreProtocol {

    /// Fetches a list of top artists
    ///
    /// - parameter completion: The completion block
    func fetchArtists(completion: @escaping ([Artist], Error?) -> ()) {

        let limit = Constants.topArtistsLimit
        guard let url = APIEndpoint.getTopArtists(limit).url() else {

            completion([], ArtistsStoreError.invalidURL)

            return
        }

        let request = URLRequest.jsonRequest(url: url)

        networkClient.sendRequest(request: request) { data, response, error in

            if let jsonData = data {

                do {

                    if let json = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String: Any],
                        let artistsDictionary = json[Constants.topArtistsDictionaryKey] as? [String: Any],
                        let artistsArray = artistsDictionary[Constants.topArtistsArrayKey] as? [[String: Any]] {

                        let artists = artistsArray.flatMap { artistDictionary -> Artist? in

                            return Artist.fromJSON(json: artistDictionary)
                        }

                        completion(artists, nil)

                    } else {

                        completion([], ArtistsStoreError.invalidResponse)
                    }

                } catch {

                    completion([], ArtistsStoreError.invalidResponse)
                }

            } else {

                completion([], ArtistsStoreError.invalidResponse)
            }
        }
    }
}
