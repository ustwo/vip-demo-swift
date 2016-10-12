//
//  ArtistsConfigurator.swift
//  VIPDemo
//
//  Created by Daniela Dias on 05/10/2016.
//  Copyright (c) 2016 ustwo. All rights reserved.
//

import UIKit


// MARK: - ArtistsConfigurator

/// _ArtistsConfigurator_ is a class responsible for configuring the VIP scene pathways for _ArtistsViewController_
class ArtistsConfigurator {

    /// Singleton instance of _ArtistsConfigurator_
    static let sharedInstance = ArtistsConfigurator()


    // MARK: - Configuration

    /// Configures the VIP scene with pathways between router, view controller, interactor and presenter
    ///
    /// - parameter viewController: The view controller
    func configure(viewController: ArtistsViewController) {
        let router = ArtistsRouter()
        router.viewController = viewController

        let presenter = ArtistsPresenter()
        presenter.output = viewController

        let interactor = ArtistsInteractor(output: presenter)

        viewController.output = interactor
        viewController.router = router
    }
}
