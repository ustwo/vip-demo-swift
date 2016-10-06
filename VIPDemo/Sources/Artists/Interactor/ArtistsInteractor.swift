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
}


// MARK: - ArtistsInteractor

class ArtistsInteractor: ArtistsInteractorInput {

    var output: ArtistsInteractorOutput!
    var worker: ArtistsWorker!


    // MARK: - Business logic

    func fetchArtists() {

        worker = ArtistsWorker()
        worker.fetchArtists { [weak self] artists, error in

            if let strongSelf = self {

                // TODO: (SM) error handling

                if let artistsError = error {

                    print("ERROR: \(artistsError)")

                } else {

                    strongSelf.output.presentArtists(artists: artists)
                }
            }
        }
    }
}
