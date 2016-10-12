//
//  ArtistPresenter.swift
//  VIPDemo
//
//  Created by Daniela Dias on 07/10/2016.
//  Copyright (c) 2016 ustwo. All rights reserved.
//

import UIKit


// MARK: - ArtistPresenterInput

/// _ArtistPresenterInput_ is a protocol for presenter input behaviours
protocol ArtistPresenterInput: ArtistInteractorOutput {

}


// MARK: - ArtistsPresenterOutput

/// _ArtistPresenterOutput_ is a protocol for presenter output behaviours
protocol ArtistPresenterOutput: class {

    /// Tells the output to display albums
    ///
    /// - parameter viewModels: The album view models
    func displayAlbums(viewModels: [AlbumViewModel])

    /// Tells the output to dislpay an error
    ///
    /// - parameter viewModel: The error view model
    func displayError(viewModel: ErrorViewModel)
}


// MARK: - ArtistsPresenter

/// _ArtistPresenter_ is a class responsible for presenting artist logic
class ArtistPresenter: ArtistPresenterInput {

    weak var output: ArtistPresenterOutput!


    /// Prepares the album models for presentation and tells the output to display albums
    ///
    /// - parameter albums: The list of albums
    func presentAlbums(albums: [Album]) {

        let viewModels = albums.flatMap { album -> AlbumViewModel in

            return AlbumViewModel(title: album.name, imageURL: album.imageURL)
        }

        output.displayAlbums(viewModels: viewModels)
    }

    /// Prepares the error model for presentation and tells the output to display error
    ///
    /// - parameter error: The error
    func presentError(error: Error) {

        let errorViewModel = ErrorViewModel(title: Strings.Error.genericTitle, message: Strings.Error.genericMessage, buttonTitles: [Strings.Error.okButtonTitle])

        output.displayError(viewModel: errorViewModel)
    }
}
