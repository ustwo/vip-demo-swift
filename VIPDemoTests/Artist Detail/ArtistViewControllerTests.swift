//
//  ArtistViewControllerTests.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 11/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest
@testable import VIPDemo


// MARK: - ArtistViewControllerTests

final class ArtistViewControllerTests: XCTestCase {

    private var window: UIWindow!
    private var artist: Artist!


    // MARK: - Setup / Teardown

    override func setUp() {

        super.setUp()

        window = UIWindow()

        let url = URL(string: "http://test.com")

        artist = Artist(mbid: "test mbid",
                        name: "test name",
                        playCount: "test playcount",
                        listeners: "test listeners",
                        url: url!,
                        imageURL: nil)
    }

    override func tearDown() {

        super.tearDown()

        window = nil
        artist = nil
    }


    // MARK: - Tests

    func testInitShouldConfigureScene() {

        // Given

        let configuratorSpy = ArtistConfiguratorSpy()

        // When

        let _ = ArtistViewController(artist: artist, configurator: configuratorSpy)

        // Then

        XCTAssertTrue(configuratorSpy.configureCalled)
    }

    func testInitShouldSetViewControllerRouter() {

        // When

        let viewController = ArtistViewController(artist: artist)

        // Then

        XCTAssertNotNil(viewController.router)
    }

    func testInitShouldSetViewControllerOutput() {

        // When

        let viewController = ArtistViewController(artist: artist)

        // Then

        XCTAssertNotNil(viewController.output)
    }

    func testInitShouldSetInteractorOutput() {

        // When

        let viewController = ArtistViewController(artist: artist)

        // Then

        if let interactor = viewController.output as? ArtistInteractor {

            XCTAssertNotNil(interactor.output)

        } else {

            XCTFail()
        }
    }

    func testInitShouldSetPresenterOutput() {

        // When

        let viewController = ArtistViewController(artist: artist)

        // Then

        if let interactor = viewController.output as? ArtistInteractor,
            let presenter = interactor.output as? ArtistPresenter {

            XCTAssertNotNil(presenter.output)

        } else {

            XCTFail()
        }
    }

    func testConfigureShouldSetRouterViewController() {

        // When

        let viewController = ArtistViewController(artist: artist)

        // Then

        XCTAssertEqual(viewController.router.viewController, viewController)
    }

    func testViewDidLoadShouldFetchAlbums() {

        // Given

        let viewController = ArtistViewController(artist: artist)

        let viewControllerOutputSpy = ArtistViewControllerOutputSpy()
        viewController.output = viewControllerOutputSpy

        // When

        loadView(window: window, viewController: viewController)

        // Then

        XCTAssertTrue(viewControllerOutputSpy.fetchAlbumsCalled)
    }

    func testViewDidLoadShouldSetupTitle() {

        // Given

        let viewController = ArtistViewController(artist: artist)

        // When

        loadView(window: window, viewController: viewController)

        // Then

        XCTAssertEqual(viewController.title, artist.name)
    }

    func testViewDidLoadShouldSetupTableViewDataSource() {

        // Given

        let viewController = ArtistViewController(artist: artist)

        // When

        loadView(window: window, viewController: viewController)

        // Then

        XCTAssertNotNil(viewController.artistView.tableView.dataSource)
    }

    func testViewDidLoadShouldSetupTableViewDelegate() {

        // Given

        let viewController = ArtistViewController(artist: artist)

        // When

        loadView(window: window, viewController: viewController)

        // Then

        XCTAssertNotNil(viewController.artistView.tableView.delegate)
    }

    func testNumberOfSectionsInTableViewShouldAlwaysBeOne() {

        // Given

        let viewController = ArtistViewController(artist: artist)
        let tableView = viewController.artistView.tableView

        // When

        let numberOfSections = viewController.numberOfSections(in: tableView)

        // Then

        XCTAssertEqual(numberOfSections, 1)
    }

    func testNumberOfRowsInAnySectionShouldEqualNumberOfAlbumsToDisplay() {

        // Given

        let viewController = ArtistViewController(artist: artist)
        let tableView = viewController.artistView.tableView

        let albumViewModel = AlbumViewModel(title: "test 1", imageURL: nil)
        viewController.displayAlbums(viewModels: [albumViewModel])

        // When

        let numberOfRows = viewController.tableView(tableView, numberOfRowsInSection: 0)

        // Then

        XCTAssertEqual(numberOfRows, 1)
    }

    func testCellForRowAtIndexShouldConfigureTableViewCellToDisplayAlbum() {

        // Given

        let viewController = ArtistViewController(artist: artist)
        let tableView = viewController.artistView.tableView

        let albumViewModel = AlbumViewModel(title: "test 1", imageURL: nil)
        viewController.displayAlbums(viewModels: [albumViewModel])

        // When

        loadView(window: window, viewController: viewController)

        // Then

        let indexPath = IndexPath(row: 0, section: 0)

        if let cell = viewController.tableView(tableView, cellForRowAt: indexPath) as? AlbumTableViewCell {

            XCTAssertEqual(cell.itemView.titleLabel.text, "test 1")

        } else {

            XCTFail()
        }
    }

    func testRefreshShouldFetchAlbums() {

        // Given

        let viewController = ArtistViewController(artist: artist)

        let viewControllerOutputSpy = ArtistViewControllerOutputSpy()
        viewController.output = viewControllerOutputSpy

        // When

        viewController.refresh()

        // Then

        XCTAssertTrue(viewControllerOutputSpy.fetchAlbumsCalled)
    }
}


// MARK: - ArtistViewControllerOutputSpy

final class ArtistViewControllerOutputSpy: ArtistViewControllerOutput {

    var albums: [Album]?
    var fetchAlbumsCalled = false

    func fetchAlbums(artistId: String) {

        fetchAlbumsCalled = true
    }
}


// MARK: - ArtistConfiguratorSpy

final class ArtistConfiguratorSpy: ArtistConfigurator {

    var configureCalled = false

    override func configure(viewController: ArtistViewController) {

        super.configure(viewController: viewController)

        configureCalled = true
    }
}
