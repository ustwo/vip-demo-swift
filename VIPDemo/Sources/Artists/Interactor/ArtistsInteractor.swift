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

        // Create some Worker to do the work

        worker = ArtistsWorker()
        worker.fetchArtists() { artists in

            // Pass the result to the Presenter

            output.presentArtists(artists: artists)
        }
    }
}
