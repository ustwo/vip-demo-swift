//
//  ArtistRouter.swift
//  VIPDemo
//
//  Created by Daniela Dias on 07/10/2016.
//  Copyright (c) 2016 ustwo. All rights reserved.
//

import UIKit


// MARK: - ArtistRouterProtocol

/// _ArtistRouterProtocol_ is a protocol for router input behaviours
protocol ArtistRouterProtocol {

    var viewController: ArtistViewController? { get }
}


// MARK: - ArtistsRouter

/// _ArtistRouter_ is a class responsible for routing from _ArtistViewController_
final class ArtistRouter: ArtistRouterProtocol {

    weak var viewController: ArtistViewController?


    // MARK: - Initializers

    /// Initializes a new instance of _ArtistRouter_
    ///
    /// - parameter viewController: The _ArtistViewController_ to route from
    ///
    /// - returns: The instance of _ArtistRouter_
    init(viewController: ArtistViewController) {

        self.viewController = viewController
    }
}
