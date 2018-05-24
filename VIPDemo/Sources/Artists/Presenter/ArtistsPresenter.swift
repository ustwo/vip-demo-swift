//
//  ArtistsPresenter.swift
//  VIPDemo
//
//  Created by Daniela Dias on 05/10/2016.
//  Copyright (c) 2016 ustwo. All rights reserved.
//

import UIKit


// MARK: - ArtistsPresenterInput

/// _ArtistsPresenterInput_ is a protocol for presenter input behaviours
protocol ArtistsPresenterInput: ArtistsInteractorOutput {

}


// MARK: - ArtistsPresenterOutput

/// _ArtistsPresenterOutput_ is a protocol for presenter output behaviours
protocol ArtistsPresenterOutput: class {

    /// Tells the output to display artists
    ///
    /// - parameter viewModels: The artist view models
    func displayArtists(viewModels: [ArtistViewModel])

    /// Tells the output to dislpay an error
    ///
    /// - parameter viewModel: The error view model
    func displayError(viewModel: ErrorViewModel)
}


// MARK: - ArtistsPresenter

/// _ArtistsPresenter_ is a class responsible for presenting artists logic
final class ArtistsPresenter {

    private(set) weak var output: ArtistsPresenterOutput?

    // MARK: - Initializers

    init(output: ArtistsPresenterOutput) {

        self.output = output
    }
}


// MARK: - ArtistsPresenterInput

extension ArtistsPresenter: ArtistsPresenterInput {

    /// Prepares the artist models for presentation and tells the output to display artists
    ///
    /// - parameter artists: The list of artists
    func presentArtists(artists: [Artist]) {

        let viewModels = artists.compactMap { artist -> ArtistViewModel in

            return ArtistViewModel(title: artist.name, imageURL: artist.imageURL)
        }

        output?.displayArtists(viewModels: viewModels)
    }

    /// Prepares the error model for presentation and tells the output to display error
    ///
    /// - parameter error: The error
    func presentError(error: Error) {

        let errorViewModel = ErrorViewModel(title: Strings.Error.genericTitle,
                                            message: Strings.Error.genericMessage,
                                            buttonTitles: [Strings.Error.okButtonTitle])

        output?.displayError(viewModel: errorViewModel)
    }
}
