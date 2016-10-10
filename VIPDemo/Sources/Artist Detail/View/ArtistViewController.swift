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

    var albums: [Album]? { get }

    func fetchAlbums(artistId: String)
}


// MARK: - ArtistViewController

class ArtistViewController: UIViewController {

    var output: ArtistViewControllerOutput!
    var router: ArtistRouter!

    fileprivate let artistView = ArtistView()

    var artist: Artist?


    // MARK: - Initializers

    init(artist: Artist) {

        self.artist = artist

        super.init(nibName: nil, bundle: nil)

        ArtistConfigurator.sharedInstance.configure(viewController: self)
    }

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

        setupTitle()
        fetchAlbums()
    }


    // MARK: - Setup

    private func setupTitle() {

        if let artistName = artist?.name {

            title = artistName

        } else {

            title = Strings.Artist.screenTitle
        }
    }


    // MARK: - Event handling

    func fetchAlbums() {

        if let artistId = artist?.mbid {

            output.fetchAlbums(artistId: artistId)
        }
    }
}


// MARK: - ArtistPresenterOutput

extension ArtistViewController: ArtistViewControllerInput {

    func displayAlbums(viewModels: [AlbumViewModel]) {

        // TODO
    }
}
