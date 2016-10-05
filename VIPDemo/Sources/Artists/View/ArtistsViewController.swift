//
//  ArtistsViewController.swift
//  VIPDemo
//
//  Created by Daniela Dias on 05/10/2016.
//  Copyright (c) 2016 ustwo. All rights reserved.
//

import UIKit


// MARK: - ArtistsViewControllerOutput

protocol ArtistsViewControllerOutput {

    func fetchArtists()
}


// MARK: - ArtistsViewController

final class ArtistsViewController: UIViewController {

    var output: ArtistsViewControllerOutput!
    var router: ArtistsRouter!


    // MARK: - Initializers

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {

        super.init(nibName: nil, bundle: nil)

        ArtistsConfigurator.sharedInstance.configure(viewController: self)
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        ArtistsConfigurator.sharedInstance.configure(viewController: self)
    }


    // MARK: - View lifecycle

    override func loadView() {

        view = ArtistsView()
    }

    override func viewDidLoad() {

        super.viewDidLoad()

        fetchArtists()
    }


    // MARK: - Event handling

    func fetchArtists() {

        // Ask the Interactor to do some work

        output.fetchArtists()
    }
}


// MARK: - ArtistsPresenterOutput

extension ArtistsViewController: ArtistsPresenterOutput {

    func displayArtists(viewModels: [ArtistsViewModel]) {

        // TODO: Make it work
    }
}
