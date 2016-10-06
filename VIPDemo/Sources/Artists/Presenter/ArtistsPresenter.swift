//
//  ArtistsPresenter.swift
//  VIPDemo
//
//  Created by Daniela Dias on 05/10/2016.
//  Copyright (c) 2016 ustwo. All rights reserved.
//

import UIKit


// MARK: - ArtistsPresenterInput

protocol ArtistsPresenterInput: ArtistsInteractorOutput {

}


// MARK: - ArtistsPresenterOutput

protocol ArtistsPresenterOutput: class {

    func displayArtists(viewModels: [ArtistsViewModel])
}


// MARK: - ArtistsPresenter

class ArtistsPresenter: ArtistsPresenterInput {

    weak var output: ArtistsPresenterOutput!

    func presentArtists(artists: [Artist]) {

        // TODO: Format the response from the Interactor and pass the result back to the View Controller

        let viewModels = [ArtistsViewModel()]

        output.displayArtists(viewModels: viewModels)
    }
}
