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

    let output: ArtistInteractorOutput
    let worker: AlbumWorker

    var albums: [Album]?


    // MARK: - Initializers

    init(output: ArtistInteractorOutput, worker: AlbumWorker = AlbumWorker()) {

        self.output = output
        self.worker = worker
    }


    // MARK: - Business logic

    func fetchAlbums(artistId: String) {

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
