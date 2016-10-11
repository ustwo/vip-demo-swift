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

    func displayArtists(viewModels: [ArtistViewModel])
    func displayError(viewModel: ErrorViewModel)
}


// MARK: - ArtistsPresenter

class ArtistsPresenter: ArtistsPresenterInput {

    weak var output: ArtistsPresenterOutput!

    func presentArtists(artists: [Artist]) {

        let viewModels = artists.flatMap { artist -> ArtistViewModel in

            return ArtistViewModel(title: artist.name, imageURL: artist.imageURL)
        }

        output.displayArtists(viewModels: viewModels)
    }

    func presentError(error: Error) {

        // TODO: (SM) investigate error 

        let errorViewModel = ErrorViewModel(title: Strings.Error.genericTitle, message: Strings.Error.genericMessage, buttonTitles: [Strings.Error.okButtonTitle])

        output.displayError(viewModel: errorViewModel)
    }
}
