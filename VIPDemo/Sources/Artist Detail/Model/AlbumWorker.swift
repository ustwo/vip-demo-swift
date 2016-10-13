//
//  AlbumWorker.swift
//  VIPDemo
//
//  Created by Daniela Dias on 07/10/2016.
//  Copyright (c) 2016 ustwo. All rights reserved.
//

import UIKit


// MARK: - AlbumWorker

/// _AlbumWorker_ is a worker object responsible to fetch albums from a store
class AlbumWorker {

    fileprivate var store: AlbumsStoreProtocol


    // MARK: - Initializers

    /// Initializes an _AlbumWorker_ with a store
    ///
    /// - parameter store: A store where to fetch albums from (API, memory, etc)
    ///
    /// - returns: The instance of _AlbumWorker_
    init(store: AlbumsStoreProtocol = AlbumsAPIStore()) {

        self.store = store
    }


    // MARK: - Business Logic

    /// Fetches albums from a store
    ///
    /// - parameter artistId:   The artist identifier
    /// - parameter completion: The completion block
    func fetchAlbums(artistId: String, completion: @escaping ([Album]?, Error?) -> ()) {

        store.fetchAlbums(artistId: artistId, completion: completion)
    }
}
