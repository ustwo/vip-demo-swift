//
//  ArtistsStore.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 06/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation

enum ArtistsStoreError: Error {

    case generic
    case invalidURL
    case invalidResponse
}

protocol ArtistsStoreProtocol {

    func fetchArtists(completion: @escaping ([Artist], Error?) -> ())
}
