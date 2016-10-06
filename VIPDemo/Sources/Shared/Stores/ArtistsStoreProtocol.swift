//
//  ArtistsStore.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 06/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


// MARK: - ArtistsStoreError

enum ArtistsStoreError: Error {

    case generic
    case invalidURL
    case invalidResponse
}


// MARK: - ArtistsStoreProtocol

protocol ArtistsStoreProtocol {

    func fetchArtists(completion: @escaping ([Artist], Error?) -> ())
}
