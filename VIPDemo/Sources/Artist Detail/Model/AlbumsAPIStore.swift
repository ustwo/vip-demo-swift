//
//  AlbumsAPIStore.swift
//  VIPDemo
//
//  Created by Daniela Dias on 10/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


// MARK: - AlbumsAPIStore

/// _AlbumsAPIStore_ is a class responsible for fetching albums
final class AlbumsAPIStore {

    fileprivate struct Constants {
        static let topAlbumsLimit = 50
        static let topAlbumsDictionaryKey = "topalbums"
        static let topAlbumsArrayKey = "album"
    }

    fileprivate let networkClient: NetworkClientProtocol


    // MARK: - Initializers

    /// Initializes an instance of _AlbumsAPIStore_ with an object that conforms to the protocol _NetworkClientProtocol_
    ///
    /// - parameter networkClient: The object to be used to send requests to the API
    ///
    /// - returns: The instance of _AlbumsAPIStore_
    init(networkClient: NetworkClientProtocol = NetworkClient.sharedInstance) {

        self.networkClient = networkClient
    }
}


// MARK: - AlbumsStoreProtocol

extension AlbumsAPIStore: AlbumsStoreProtocol {

    /// Fetches a list of top albums for an artist
    ///
    /// - parameter artistId:   The artist identifier
    /// - parameter completion: The completion block
    func fetchAlbums(artistId: String, completion: @escaping ([Album], Error?) -> ()) {

        let limit = Constants.topAlbumsLimit
        guard let url = APIEndpoint.getTopAlbums(artistId, limit).url() else {

            completion([], AlbumsStoreError.invalidURL)

            return
        }

        let request = URLRequest.jsonRequest(url: url)

        networkClient.sendRequest(request: request) { data, response, error in

            if let jsonData = data {

                do {

                    if let json = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String: Any],
                        let albumsDictionary = json[Constants.topAlbumsDictionaryKey] as? [String: Any],
                        let albumsArray = albumsDictionary[Constants.topAlbumsArrayKey] as? [[String: Any]] {

                        let albums = albumsArray.flatMap { albumDictionary -> Album? in

                            return Album.fromJSON(json: albumDictionary)
                        }

                        completion(albums, nil)

                    } else {

                        completion([], AlbumsStoreError.invalidResponse)
                    }

                } catch {

                    completion([], AlbumsStoreError.invalidResponse)
                }

            } else {

                completion([], AlbumsStoreError.invalidResponse)
            }
        }
    }
}
