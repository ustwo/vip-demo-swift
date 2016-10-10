//
//  AlbumsAPIStore.swift
//  VIPDemo
//
//  Created by Daniela Dias on 10/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


// MARK: - AlbumsAPIStore

final class AlbumsAPIStore: AlbumsStoreProtocol {

    private struct Constants {
        static let topAlbumsLimit = 50
        static let topAlbumsDictionaryKey = "topalbums"
        static let topAlbumsArrayKey = "album"
    }

    func fetchAlbums(artistId: String, completion: @escaping ([Album], Error?) -> ()) {

        let limit = Constants.topAlbumsLimit
        guard let url = APIEndpoint.getTopAlbums(artistId, limit).url() else {

            completion([], AlbumsStoreError.invalidURL)

            return
        }

        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        print("url \(url)")

        NetworkClient.sharedInstance.sendRequest(request: request) { (data, response, error) in

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