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

    func navigateToArtist()
}


// MARK: - ArtistsRouter

class ArtistsRouter: ArtistsRouterInput {

    weak var viewController: ArtistsViewController!


    // MARK: - ArtistsRouterInput

    func navigateToArtist() {

        let artistViewController = ArtistViewController()
        viewController.navigationController?.pushViewController(artistViewController, animated: true)
    }
}
