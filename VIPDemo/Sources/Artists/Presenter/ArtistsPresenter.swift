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
}


// MARK: - ArtistsPresenter

class ArtistsPresenter: ArtistsPresenterInput {

    weak var output: ArtistsPresenterOutput!

    func presentArtists(artists: [Artist]) {

        let viewModels = artists.flatMap { artist -> ArtistViewModel in

            return ArtistViewModel(title: artist.name)
        }

        output.displayArtists(viewModels: viewModels)
    }
}
