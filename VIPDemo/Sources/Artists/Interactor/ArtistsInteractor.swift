//
//  ArtistsInteractor.swift
//  VIPDemo
//
//  Created by Daniela Dias on 05/10/2016.
//  Copyright (c) 2016 ustwo. All rights reserved.
//

import UIKit


// MARK: - ArtistsInteractorInput

/// _ArtistsInteractorInput_ is a protocol for interactor input behaviours
protocol ArtistsInteractorInput: ArtistsViewControllerOutput {

}


// MARK: - ArtistsInteractorOutput

/// _ArtistsInteractorOutput_ is a protocol for interactor output behaviours
protocol ArtistsInteractorOutput {

    /// Tells the output to present artists
    ///
    /// - parameter artists: The list of artists to present
    func presentArtists(artists: [Artist])

    /// Tells the output to present an error
    ///
    /// - parameter error: The error to present
    func presentError(error: Error)
}


// MARK: - ArtistsInteractor

/// _ArtistsInteractor_ is an interactor responsible for top artists business logic
final class ArtistsInteractor: ArtistsInteractorInput {

    let output: ArtistsInteractorOutput
    let worker: ArtistsWorker

    var artists: [Artist]?


    // MARK: - Initializers

    /// Initializes an instance of _ArtistsInteractor_ with an output and a worker
    ///
    /// - parameter output: The interactors output
    /// - parameter worker: The artits worker used to fetch artists
    ///
    /// - returns: An instance of _ArtistsInteractor_
    init(output: ArtistsInteractorOutput, worker: ArtistsWorker = ArtistsWorker()) {

        self.output = output
        self.worker = worker
    }


    // MARK: - Business logic

    /// Fetches a list of top artists through the worker
    func fetchArtists() {

        worker.fetchArtists { [weak self] artists, error in

            if let strongSelf = self {

                if let artistsError = error {

                    strongSelf.output.presentError(error: artistsError)

                } else {

                    strongSelf.artists = artists
                    strongSelf.output.presentArtists(artists: artists)
                }
            }
        }
    }
}
