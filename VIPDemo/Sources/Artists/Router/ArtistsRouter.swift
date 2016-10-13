//
//  ArtistsRouter.swift
//  VIPDemo
//
//  Created by Daniela Dias on 05/10/2016.
//  Copyright (c) 2016 ustwo. All rights reserved.
//

import UIKit


// MARK: - ArtistsRouterInput

/// _ArtistsRouterInput_ is a protocol for router input behaviours
protocol ArtistsRouterInput {

    weak var viewController: ArtistsViewController? { get set }

    /// Handles the navigation when selecting an artist in the list
    ///
    /// - parameter indexPath: The selected index path
    func navigateToArtist(atIndexPath indexPath: IndexPath)
}


// MARK: - ArtistsRouter

/// _ArtistsRouter_ is a class responsible for routing from _ArtistsViewController_
final class ArtistsRouter: ArtistsRouterInput {

    weak var viewController: ArtistsViewController?


    // MARK: - ArtistsRouterInput

    /// Handles the navigation when selecting an artist in the list to artist detail
    ///
    /// - parameter indexPath: The selected index path
    func navigateToArtist(atIndexPath indexPath: IndexPath) {

        if let artists = viewController?.output.artists, indexPath.row < artists.count {

            let selectedArtist = artists[indexPath.row]

            let artistViewController = ArtistViewController(artist: selectedArtist)
            viewController?.navigationController?.pushViewController(artistViewController, animated: true)
        }
    }
}
