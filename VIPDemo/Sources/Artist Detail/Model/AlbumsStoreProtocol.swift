//
//  AlbumsStoreProtocol.swift
//  VIPDemo
//
//  Created by Daniela Dias on 10/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


// MARK: - AlbumsStoreError

/// _AlbumsStoreError_ is an enumeration for album store errors
///
/// - generic:         Generic error
/// - invalidURL:      Invalid URL error
/// - invalidResponse: Invalid response
enum AlbumsStoreError: Error {

    case generic
    case invalidURL
    case invalidResponse
}


// MARK: - AlbumsStoreProtocol

/// _AlbumsStoreProtocol_ is a protocol  for album store behaviors
protocol AlbumsStoreProtocol {

    /// Fetches albums from a store (API, memory, etc)
    ///
    /// - parameter artistId:   The artist identifier
    /// - parameter completion: The completion block
    func fetchAlbums(artistId: String, completion: @escaping ([Album], Error?) -> ())
}
