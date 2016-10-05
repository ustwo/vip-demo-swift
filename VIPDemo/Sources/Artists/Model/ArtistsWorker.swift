//
//  ArtistsWorker.swift
//  VIPDemo
//
//  Created by Daniela Dias on 05/10/2016.
//  Copyright (c) 2016 ustwo. All rights reserved.
//

import UIKit


// MARK: - ArtistsWorker

class ArtistsWorker {


    // MARK: - Business Logic

    func fetchArtists(completion: ([Artist]) -> ()) {

        // TODO: Do the work

        let artist = Artist()
        completion([artist])
    }
}
