//
//  ArtistsWorker.swift
//  VIPDemo
//
//  Created by Daniela Dias on 05/10/2016.
//  Copyright (c) 2016 ustwo. All rights reserved.
//

import UIKit


// MARK: - ArtistsWorker

/// _ArtistsWorker_ is a worker object responsible to fetch artists from a store
class ArtistsWorker {

    fileprivate var store: ArtistsStoreProtocol


    // MARK: - Initializers

    /// Initializes an _ArtistsWorker_ with a store
    ///
    /// - parameter store: A store where to fetch artists from (API, memory, etc)
    ///
    /// - returns: The instance of _ArtistsWorker_
    init(store: ArtistsStoreProtocol = ArtistsAPIStore()) {

        self.store = store
    }


    // MARK: - Business Logic

    /// Fetches artists from a store
    ///
    /// - parameter completion: The completion block
    func fetchArtists(completion: @escaping ([Artist]?, Error?) -> ()) {

        store.fetchArtists(completion: completion)
    }
}
