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

class ArtistsRouter {

    weak var viewController: ArtistsViewController!
}


// MARK: - ArtistsRouterInput

extension ArtistsRouter: ArtistsRouterInput {

    func navigateToArtist() {

    }
}
