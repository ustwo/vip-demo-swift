//
//  ArtistRouter.swift
//  VIPDemo
//
//  Created by Daniela Dias on 07/10/2016.
//  Copyright (c) 2016 ustwo. All rights reserved.
//

import UIKit


// MARK: - ArtistRouterInput

/// _ArtistRouterInput_ is a protocol for router input behaviours
protocol ArtistRouterInput {

    weak var viewController: ArtistViewController? { get set }
}


// MARK: - ArtistsRouter

/// _ArtistRouter_ is a class responsible for routing from _ArtistViewController_
final class ArtistRouter: ArtistRouterInput {

    weak var viewController: ArtistViewController?

}
