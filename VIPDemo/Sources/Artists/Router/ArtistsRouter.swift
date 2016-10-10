//
//  ArtistsRouter.swift
//  VIPDemo
//
//  Created by Daniela Dias on 05/10/2016.
//  Copyright (c) 2016 ustwo. All rights reserved.
//

import UIKit


// MARK: - ArtistsRouterInput

protocol ArtistsRouterInput {

    func navigateToArtist(atIndexPath indexPath: IndexPath)
}


// MARK: - ArtistsRouter

class ArtistsRouter: ArtistsRouterInput {

    weak var viewController: ArtistsViewController!


    // MARK: - ArtistsRouterInput

    func navigateToArtist(atIndexPath indexPath: IndexPath) {

        if let selectedArtist = viewController.output.artists?[indexPath.row] {

            let artistViewController = ArtistViewController(artist: selectedArtist)
            viewController.navigationController?.pushViewController(artistViewController, animated: true)
        }
    }
}
