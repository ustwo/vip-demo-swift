//
//  ArtistsWorker.swift
//  VIPDemo
//
//  Created by Daniela Dias on 05/10/2016.
//  Copyright (c) 2016 ustwo. All rights reserved.
//

import UIKit


// MARK: - ArtistsWorker

final class ArtistsWorker {

    fileprivate var store: ArtistsStoreProtocol

    init(store: ArtistsStoreProtocol = ArtistsAPIStore()) {

        self.store = store
    }


    // MARK: - Business Logic

    func fetchArtists(completion: @escaping ([Artist], Error?) -> ()) {

        store.fetchArtists(completion: completion)
    }
}