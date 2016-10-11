//
//  ArtistConfigurator.swift
//  VIPDemo
//
//  Created by Daniela Dias on 07/10/2016.
//  Copyright (c) 2016 ustwo. All rights reserved.
//

import UIKit


// MARK: - ArtistConfigurator

class ArtistConfigurator {

    static let sharedInstance = ArtistConfigurator()


    // MARK: - Configuration

    func configure(viewController: ArtistViewController) {
        let router = ArtistRouter()
        router.viewController = viewController

        let presenter = ArtistPresenter()
        presenter.output = viewController

        let interactor = ArtistInteractor()
        interactor.output = presenter

        viewController.output = interactor
        viewController.router = router
    }
}
