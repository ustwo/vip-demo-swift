//
//  AlbumWorker.swift
//  VIPDemo
//
//  Created by Daniela Dias on 07/10/2016.
//  Copyright (c) 2016 ustwo. All rights reserved.
//

import UIKit


// MARK: - AlbumWorker

class AlbumWorker {

    fileprivate var store: AlbumsStoreProtocol


    // MARK: - Initializers

    init(store: AlbumsStoreProtocol = AlbumsAPIStore()) {

        self.store = store
    }


    // MARK: - Business Logic

    func fetchAlbums(artistId: String, completion: @escaping ([Album], Error?) -> ()) {

        store.fetchAlbums(artistId: artistId, completion: completion)
    }
}
