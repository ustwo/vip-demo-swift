//
//  ArtistViewController.swift
//  VIPDemo
//
//  Created by Daniela Dias on 07/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import UIKit


// MARK: - ArtistViewControllerInput

protocol ArtistViewControllerInput: ArtistPresenterOutput {

}


// MARK: - ArtistViewControllerOutput

protocol ArtistViewControllerOutput {

}


// MARK: - ArtistViewController

class ArtistViewController: UIViewController {

    var output: ArtistViewControllerOutput!
    var router: ArtistRouter!

    fileprivate let artistView = ArtistView()


    // MARK: - Initializers

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {

        super.init(nibName: nil, bundle: nil)

        ArtistConfigurator.sharedInstance.configure(viewController: self)
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        ArtistConfigurator.sharedInstance.configure(viewController: self)
    }


    // MARK: - View lifecycle

    override func loadView() {

        view = artistView
    }

    override func viewDidLoad() {

        super.viewDidLoad()

        title = Strings.Artist.screenTitle
    }
}


// MARK: - ArtistPresenterOutput

extension ArtistViewController: ArtistViewControllerInput {

    func displayArtist(viewModel: ArtistViewModel) {

        // TODO
    }
}
