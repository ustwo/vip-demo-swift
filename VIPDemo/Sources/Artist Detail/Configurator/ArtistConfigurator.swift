//
//  ArtistConfigurator.swift
//  VIPDemo
//
//  Created by Daniela Dias on 07/10/2016.
//  Copyright (c) 2016 ustwo. All rights reserved.
//

import UIKit


// MARK: - ArtistConfigurator

/// _ArtistConfigurator_ is a class responsible for configuring the VIP scene pathways for _ArtistViewController_
class ArtistConfigurator {

    /// Singleton instance of _ArtistConfigurator_
    static let sharedInstance = ArtistConfigurator()


    // MARK: - Configuration

    /// Configures the VIP scene with pathways between router, view controller, interactor and presenter
    ///
    /// - parameter viewController: The view controller
    func configure(viewController: ArtistViewController) {
        let router = ArtistRouter()
        router.viewController = viewController

        let presenter = ArtistPresenter()
        presenter.output = viewController

        let interactor = ArtistInteractor(output: presenter)

        viewController.output = interactor
        viewController.router = router
    }
}
