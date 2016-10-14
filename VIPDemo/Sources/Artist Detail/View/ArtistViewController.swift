//
//  ArtistViewController.swift
//  VIPDemo
//
//  Created by Daniela Dias on 07/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import UIKit


// MARK: - ArtistViewControllerInput

/// _ArtistViewControllerInput_ is a protocol for view controller input behaviours
protocol ArtistViewControllerInput: ArtistPresenterOutput {

}


// MARK: - ArtistViewControllerOutput

/// _ArtistViewControllerInput_ is a protocol for view controller output behaviours
protocol ArtistViewControllerOutput {

    var albums: [Album]? { get }


    /// Tells the output (interactor) to fetch albums for artist
    ///
    /// - parameter artistId: The artist identifier
    func fetchAlbums(artistId: String)
}


// MARK: - ArtistViewController

/// _ArtistViewController_ is a view controller responsible for displaying artist details like a list of albums
final class ArtistViewController: UIViewController, ErrorPresenter {

    var output: ArtistViewControllerOutput!
    var router: ArtistRouterProtocol!

    let artistView = ArtistView()

    fileprivate var albumsViewModels: [AlbumViewModel] = []

    var artist: Artist?


    // MARK: - Initializers

    /// Initializes an instance of _ArtistViewController_ with artist and configurator
    ///
    /// - parameter artist:       The artist
    /// - parameter configurator: The configurator
    ///
    /// - returns: The instance of _ArtistViewController_
    init(artist: Artist, configurator: ArtistConfigurator = ArtistConfigurator.sharedInstance) {

        self.artist = artist

        super.init(nibName: nil, bundle: nil)

        configure(configurator: configurator)
    }

    /// Initializes an instance of _ArtistViewController_ from storyboard
    ///
    /// - parameter coder: The coder
    ///
    /// - returns: The instance of _ArtistViewController_
    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure(configurator: ArtistConfigurator.sharedInstance)
    }


    // MARK: - Configurator

    private func configure(configurator: ArtistConfigurator = ArtistConfigurator.sharedInstance) {

        configurator.configure(viewController: self)
    }


    // MARK: - View lifecycle

    override func loadView() {

        view = artistView
    }

    override func viewDidLoad() {

        super.viewDidLoad()

        setupTitle()
        setupTableView()
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

    private func setupTableView() {

        artistView.tableView.delegate = self
        artistView.tableView.dataSource = self
        artistView.tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: AlbumTableViewCell.reuseIdentifier())
        artistView.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)

    }


    // MARK: - Event handling

    /// Asks the output to fetch albums
    func fetchAlbums() {

        if let artistId = artist?.mbid {

            output.fetchAlbums(artistId: artistId)
        }
    }

    /// Asks the output to fetch albums. Called when there is a need to refresh the album list
    func refresh() {

        fetchAlbums()
    }
}


// MARK: - UITableViewDataSource

extension ArtistViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return albumsViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTableViewCell.reuseIdentifier(), for: indexPath) as? AlbumTableViewCell else {

            assert(false, "Invalid table view cell. Did you forget to register AlbumTableViewCell?")

            return UITableViewCell()
        }

        let viewModel = albumsViewModels[indexPath.row]
        cell.viewModel = viewModel

        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        return Strings.Artist.albumsTitle
    }
}


// MARK: - UITableViewDelegate

extension ArtistViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // Do nothing for now
    }
}


// MARK: - ArtistPresenterOutput

extension ArtistViewController: ArtistViewControllerInput {

    func displayAlbums(viewModels: [AlbumViewModel]) {

        albumsViewModels = viewModels
        artistView.tableView.reloadData()
        artistView.refreshControl.endRefreshing()
    }

    func displayError(viewModel: ErrorViewModel) {

        artistView.refreshControl.endRefreshing()
        self.presentError(viewModel: viewModel)
    }
}
