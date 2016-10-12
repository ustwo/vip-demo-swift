//
//  ArtistInteractor.swift
//  VIPDemo
//
//  Created by Daniela Dias on 07/10/2016.
//  Copyright (c) 2016 ustwo. All rights reserved.
//

import UIKit


// MARK: - ArtistInteractorInput

/// _ArtistInteractorInput_ is a protocol for interactor input behaviours
protocol ArtistInteractorInput: ArtistViewControllerOutput {

}


// MARK: - ArtistInteractorOutput

/// _ArtistInteractorOutput_ is a protocol for interactor output behaviours
protocol ArtistInteractorOutput {

    /// Tells the output to present albums
    ///
    /// - parameter albums: The list of albums to present
    func presentAlbums(albums: [Album])

    /// Tells the output to present an error
    ///
    /// - parameter error: The error to present
    func presentError(error: Error)
}


// MARK: - ArtistInteractor

/// _ArtistInteractor_ is an interactor responsible for artist details business logic
class ArtistInteractor: ArtistInteractorInput {

    let output: ArtistInteractorOutput
    let worker: AlbumWorker

    var albums: [Album]?


    // MARK: - Initializers

    /// Initializes an instance of _ArtistInteractor_ with an output and a worker
    ///
    /// - parameter output: The interactors output
    /// - parameter worker: The album worker used to fetch albums
    ///
    /// - returns: An instance of _ArtistInteractor_
    init(output: ArtistInteractorOutput, worker: AlbumWorker = AlbumWorker()) {

        self.output = output
        self.worker = worker
    }


    // MARK: - Business logic

    /// Fetches a list of top albums for an artist through the worker
    ///
    /// - parameter artistId: The artist identifier
    func fetchAlbums(artistId: String) {

        worker.fetchAlbums(artistId: artistId) { [weak self] albums, error in

            if let strongSelf = self {

                if let albumsError = error {

                    strongSelf.output.presentError(error: albumsError)

                } else {

                    strongSelf.albums = albums
                    strongSelf.output.presentAlbums(albums: albums)
                }
            }
        }
    }
}
