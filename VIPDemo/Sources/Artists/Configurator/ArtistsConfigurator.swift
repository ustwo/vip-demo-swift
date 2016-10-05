//
//  ArtistsConfigurator.swift
//  VIPDemo
//
//  Created by Daniela Dias on 05/10/2016.
//  Copyright (c) 2016 ustwo. All rights reserved.
//

import UIKit


// MARK: - ArtistsConfigurator

class ArtistsConfigurator {

    static let sharedInstance = ArtistsConfigurator()


    // MARK: - Configuration

    func configure(viewController: ArtistsViewController) {
        let router = ArtistsRouter()
        router.viewController = viewController

        let presenter = ArtistsPresenter()
        presenter.output = viewController

        let interactor = ArtistsInteractor()
        interactor.output = presenter

        viewController.output = interactor
        viewController.router = router
    }
}
