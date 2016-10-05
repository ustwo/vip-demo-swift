//
//  ArtistsPresenter.swift
//  VIPDemo
//
//  Created by Daniela Dias on 05/10/2016.
//  Copyright (c) 2016 ustwo. All rights reserved.
//

import UIKit


// MARK: - ArtistsPresenterOutput

protocol ArtistsPresenterOutput: class {

    func displayArtists(viewModels: [ArtistsViewModel])
}


// MARK: - ArtistsPresenter

class ArtistsPresenter {

    weak var output: ArtistsPresenterOutput!
}


// MARK: - ArtistsInteractorOutput

extension ArtistsPresenter: ArtistsInteractorOutput {

    func presentArtists(artists: [Artist]) {

        // TODO: Format the response from the Interactor and pass the result back to the View Controller

        let viewModels = [ArtistsViewModel()]

        output.displayArtists(viewModels: viewModels)
    }
}
