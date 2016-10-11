//
//  ArtistsInteractor.swift
//  VIPDemo
//
//  Created by Daniela Dias on 05/10/2016.
//  Copyright (c) 2016 ustwo. All rights reserved.
//

import UIKit


// MARK: - ArtistsInteractorInput

protocol ArtistsInteractorInput: ArtistsViewControllerOutput {

}


// MARK: - ArtistsInteractorOutput

protocol ArtistsInteractorOutput {

    func presentArtists(artists: [Artist])
    func presentError(error: Error)
}


// MARK: - ArtistsInteractor

class ArtistsInteractor: ArtistsInteractorInput {

    let output: ArtistsInteractorOutput
    let worker: ArtistsWorker

    var artists: [Artist]?


    // MARK: - Initializers

    init(output: ArtistsInteractorOutput, worker: ArtistsWorker = ArtistsWorker()) {

        self.output = output
        self.worker = worker
    }


    // MARK: - Business logic

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
