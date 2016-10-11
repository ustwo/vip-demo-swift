//
//  ArtistsAPIStore.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 06/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


// MARK: - ArtistsAPIStore

final class ArtistsAPIStore: ArtistsStoreProtocol {

    private struct Constants {
        static let topArtistsLimit = 50
        static let topArtistsDictionaryKey = "artists"
        static let topArtistsArrayKey = "artist"
    }

    func fetchArtists(completion: @escaping ([Artist], Error?) -> ()) {

        let limit = Constants.topArtistsLimit
        guard let url = APIEndpoint.getTopArtists(limit).url() else {

            completion([], ArtistsStoreError.invalidURL)

            return
        }

        let request = URLRequest.jsonRequest(url: url)

        NetworkClient.sharedInstance.sendRequest(request: request) { (data, response, error) in

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
