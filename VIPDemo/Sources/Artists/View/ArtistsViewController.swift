//
//  ArtistsViewController.swift
//  VIPDemo
//
//  Created by Daniela Dias on 05/10/2016.
//  Copyright (c) 2016 ustwo. All rights reserved.
//

import UIKit


// MARK: - ArtistsViewControllerInput

/// _ArtistsViewControllerInput_ is a protocol for view controller input behaviours
protocol ArtistsViewControllerInput: ArtistsPresenterOutput {

}


// MARK: - ArtistsViewControllerOutput

/// _ArtistsViewControllerInput_ is a protocol for view controller output behaviours
protocol ArtistsViewControllerOutput {

    var artists: [Artist]? { get }


    /// Tells the output (interactor) to fetch top artists
    func fetchArtists()
}


// MARK: - ArtistsViewController

/// _ArtistsViewController_ is a view controller responsible for displaying a list of top artists
final class ArtistsViewController: UIViewController, ErrorPresenter {

    var output: ArtistsViewControllerOutput!
    var router: ArtistsRouterInput!

    let artistsView = ArtistsView()

    fileprivate var artistsViewModels: [ArtistViewModel] = []


    // MARK: - Initializers

    /// Initializes an instance of _ArtistsViewController_ with a configurator
    ///
    /// - parameter configurator: The configurator
    ///
    /// - returns: The instance of _ArtistsViewController_
    init(configurator: ArtistsConfigurator = ArtistsConfigurator.sharedInstance) {

        super.init(nibName: nil, bundle: nil)

        configure(configurator: configurator)
    }

    /// Initializes an instance of _ArtistsViewController_ from storyboard
    ///
    /// - parameter coder: The coder
    ///
    /// - returns: The instance of _ArtistsViewController_
    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure(configurator: ArtistsConfigurator.sharedInstance)
    }


    // MARK: - Configurator

    private func configure(configurator: ArtistsConfigurator = ArtistsConfigurator.sharedInstance) {

        configurator.configure(viewController: self)
    }


    // MARK: - View lifecycle

    override func loadView() {

        view = artistsView
    }

    override func viewDidLoad() {

        super.viewDidLoad()

        setupTitle()
        setupTableView()
        fetchArtists()
    }


    // MARK: - Setup

    private func setupTitle() {

        title = Strings.Artists.screenTitle
    }

    private func setupTableView() {

        artistsView.tableView.delegate = self
        artistsView.tableView.dataSource = self
        artistsView.tableView.register(ArtistTableViewCell.self, forCellReuseIdentifier: ArtistTableViewCell.reuseIdentifier())
        artistsView.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }


    // MARK: - Event handling

    /// Asks the output to fetch artists
    func fetchArtists() {

        output.fetchArtists()
    }

    /// Asks the output to fetch artists. Called when there is a need to refresh the artists list
    func refresh() {

        fetchArtists()
    }
}


// MARK: - UITableViewDataSource

extension ArtistsViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return artistsViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArtistTableViewCell.reuseIdentifier(), for: indexPath) as? ArtistTableViewCell else {

            return UITableViewCell()
        }

        let viewModel = artistsViewModels[indexPath.row]
        cell.viewModel = viewModel

        return cell
    }
}


// MARK: - UITableViewDelegate

extension ArtistsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        router.navigateToArtist(atIndexPath: indexPath)
    }
}


// MARK: - ArtistsPresenterOutput

extension ArtistsViewController: ArtistsViewControllerInput {

    func displayArtists(viewModels: [ArtistViewModel]) {

        artistsViewModels = viewModels
        artistsView.tableView.reloadData()
        artistsView.refreshControl.endRefreshing()
    }

    func displayError(viewModel: ErrorViewModel) {

        artistsView.refreshControl.endRefreshing()
        presentError(viewModel: viewModel)
    }
}
