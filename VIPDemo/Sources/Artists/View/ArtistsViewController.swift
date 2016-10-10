//
//  ArtistsViewController.swift
//  VIPDemo
//
//  Created by Daniela Dias on 05/10/2016.
//  Copyright (c) 2016 ustwo. All rights reserved.
//

import UIKit


// MARK: - ArtistsViewControllerInput

protocol ArtistsViewControllerInput: ArtistsPresenterOutput {

}


// MARK: - ArtistsViewControllerOutput

protocol ArtistsViewControllerOutput {

    var artists: [Artist]? { get }

    func fetchArtists()
}


// MARK: - ArtistsViewController

final class ArtistsViewController: UIViewController {

    var output: ArtistsViewControllerOutput!
    var router: ArtistsRouter!

    fileprivate let artistsView = ArtistsView()
    fileprivate var artistsViewModels: [ArtistViewModel] = []


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
    }


    // MARK: - Event handling

    func fetchArtists() {

        output.fetchArtists()
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
    }
}
