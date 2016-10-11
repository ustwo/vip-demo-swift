//
//  ArtistInteractor.swift
//  VIPDemo
//
//  Created by Daniela Dias on 07/10/2016.
//  Copyright (c) 2016 ustwo. All rights reserved.
//

import UIKit


// MARK: - ArtistInteractorInput

protocol ArtistInteractorInput: ArtistViewControllerOutput {

}


// MARK: - ArtistInteractorOutput

protocol ArtistInteractorOutput {

    func presentAlbums(albums: [Album])
    func presentError(error: Error)
}


// MARK: - ArtistInteractor

class ArtistInteractor: ArtistInteractorInput {

    var output: ArtistInteractorOutput!
    var worker: AlbumWorker!

    var albums: [Album]?


    // MARK: - Business logic

    func fetchAlbums(artistId: String) {

        worker = AlbumWorker()
        worker.fetchAlbums(artistId: artistId) { [weak self] albums, error in

            if let strongSelf = self {

                if let albumsError = error {

                    strongSelf.output.presentError(error: albumsError)

                } else {

                    strongSelf.albums = albums
                    strongSelf.output.presentAlbums(albums: albums)
                }
            }
        }
    }
}
