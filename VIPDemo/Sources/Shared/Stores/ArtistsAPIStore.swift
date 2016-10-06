//
//  ArtistsAPIStore.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 06/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


final class ArtistsAPIStore: ArtistsStoreProtocol {

    struct Constants {
        static let topArtistsLimit = 50
    }

    func fetchArtists(completion: @escaping ([Artist], Error?) -> ()) {

        let limit = Constants.topArtistsLimit
        guard let url = APIEndpoint.getTopArtists(limit).url() else {

            completion([], ArtistsStoreError.invalidURL)

            return
        }

        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        NetworkClient.sharedInstance.sendRequest(request: request) { (data, response, error) in

            let artists: [Artist] = []

            if let jsonData = data {

                let dataString = String(data: jsonData, encoding: String.Encoding.utf8)

                print("data \(dataString)")

                // TODO: parse

                completion(artists, nil)

            } else {

                completion([], ArtistsStoreError.invalidResponse)
            }
        }
    }
}
