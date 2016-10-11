//
//  ArtistPresenter.swift
//  VIPDemo
//
//  Created by Daniela Dias on 07/10/2016.
//  Copyright (c) 2016 ustwo. All rights reserved.
//

import UIKit


// MARK: - ArtistPresenterInput

protocol ArtistPresenterInput: ArtistInteractorOutput {

}


// MARK: - ArtistsPresenterOutput

protocol ArtistPresenterOutput: class {

    func displayAlbums(viewModels: [AlbumViewModel])
}


// MARK: - ArtistsPresenter

class ArtistPresenter: ArtistPresenterInput {

    weak var output: ArtistPresenterOutput!

    func presentAlbums(albums: [Album]) {

        let viewModels = albums.flatMap { album -> AlbumViewModel in

            return AlbumViewModel(title: album.name, imageURL: album.imageURL)
        }

        output.displayAlbums(viewModels: viewModels)
    }
}
