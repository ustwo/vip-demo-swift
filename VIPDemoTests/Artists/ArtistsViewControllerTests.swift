//
//  ArtistsViewControllerTests.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 11/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest
@testable import VIPDemo


// MARK: - ArtistsViewControllerTests

final class ArtistsViewControllerTests: XCTestCase {

    private var window: UIWindow!


    // MARK: - Setup / Teardown

    override func setUp() {

        super.setUp()

        window = UIWindow()
    }

    override func tearDown() {

        super.tearDown()

        window = nil
    }


    // MARK: - Tests

    func testInitShouldSetViewControllerRouter() {

        // When

        let viewController = ArtistsViewController()

        // Then

        XCTAssertNotNil(viewController.router)
    }

    func testInitShouldSetViewControllerOutput() {

        // When

        let viewController = ArtistsViewController()

        // Then

        XCTAssertNotNil(viewController.output)
    }

    func testInitShouldSetInteractorOutput() {

        // When

        let viewController = ArtistsViewController()

        // Then

        if let interactor = viewController.output as? ArtistsInteractor {

            XCTAssertNotNil(interactor.output)

        } else {

            XCTFail()
        }
    }

    func testInitShouldSetPresenterOutput() {

        // When

        let viewController = ArtistsViewController()

        // Then

        if let interactor = viewController.output as? ArtistsInteractor,
            let presenter = interactor.output as? ArtistsPresenter {

            XCTAssertNotNil(presenter.output)

        } else {

            XCTFail()
        }
    }

    func testConfigureShouldSetRouterViewController() {

        // When

        let viewController = ArtistsViewController()

        // Then

        XCTAssertEqual(viewController.router.viewController, viewController)
    }

    func testViewDidLoadShouldFetchArtists() {

        // Given

        let viewController = ArtistsViewController()

        let viewControllerOutputSpy = ArtistsViewControllerOutputSpy()
        viewController.output = viewControllerOutputSpy

        // When

        loadView(window: window, viewController: viewController)

        // Then

        XCTAssertTrue(viewControllerOutputSpy.fetchArtistsCalled)
    }

    func testViewDidLoadShouldSetupTitle() {

        // Given

        let viewController = ArtistsViewController()

        // When

        loadView(window: window, viewController: viewController)

        // Then

        XCTAssertEqual(viewController.title, Strings.Artists.screenTitle)
    }

    func testViewDidLoadShouldSetupTableViewDataSource() {

        // Given

        let viewController = ArtistsViewController()

        // When

        loadView(window: window, viewController: viewController)

        // Then

        XCTAssertNotNil(viewController.artistsView.tableView.dataSource)
    }

    func testViewDidLoadShouldSetupTableViewDelegate() {

        // Given

        let viewController = ArtistsViewController()

        // When

        loadView(window: window, viewController: viewController)

        // Then

        XCTAssertNotNil(viewController.artistsView.tableView.delegate)
    }

    func testNumberOfSectionsInTableViewShouldAlwaysBeOne() {

        // Given

        let viewController = ArtistsViewController()
        let tableView = viewController.artistsView.tableView

        // When

        let numberOfSections = viewController.numberOfSections(in: tableView)

        // Then

        XCTAssertEqual(numberOfSections, 1)
    }

    func testNumberOfRowsInAnySectionShouldEqualNumberOfArtistsToDisplay() {

        // Given

        let viewController = ArtistsViewController()
        let tableView = viewController.artistsView.tableView

        let artistViewModel = ArtistViewModel(title: "test 1", imageURL: nil)
        viewController.displayArtists(viewModels: [artistViewModel])

        // When

        let numberOfRows = viewController.tableView(tableView, numberOfRowsInSection: 0)

        // Then

        XCTAssertEqual(numberOfRows, 1)
    }

    func testCellForRowAtIndexShouldConfigureTableViewCellToDisplayArtist() {

        // Given

        let viewController = ArtistsViewController()
        let tableView = viewController.artistsView.tableView

        let artistViewModel = ArtistViewModel(title: "test 1", imageURL: nil)
        viewController.displayArtists(viewModels: [artistViewModel])

        // When

        loadView(window: window, viewController: viewController)

        // Then

        let indexPath = IndexPath(row: 0, section: 0)

        if let cell = viewController.tableView(tableView, cellForRowAt: indexPath) as? ArtistTableViewCell {

            XCTAssertEqual(cell.itemView.titleLabel.text, "test 1")

        } else {

            XCTFail()
        }
    }

    func testDidSelectRowAtIndexShouldNavigateToArtist() {

        // Given

        let viewController = ArtistsViewController()
        let tableView = viewController.artistsView.tableView

        let router = ArtistsRouterProtocolSpy()
        viewController.router = router

        let artistViewModel = ArtistViewModel(title: "test 1", imageURL: nil)
        viewController.displayArtists(viewModels: [artistViewModel])

        // When

        loadView(window: window, viewController: viewController)

        let indexPath = IndexPath(row: 0, section: 0)
        viewController.tableView(tableView, didSelectRowAt: indexPath)

        // Then

        XCTAssertTrue(router.navigateToArtistCalled)
    }

    func testRefreshShouldFetchArtists() {

        // Given

        let viewController = ArtistsViewController()

        let viewControllerOutputSpy = ArtistsViewControllerOutputSpy()
        viewController.output = viewControllerOutputSpy

        // When

        viewController.refresh()

        // Then

        XCTAssertTrue(viewControllerOutputSpy.fetchArtistsCalled)
    }
}


// MARK: - ArtistsViewControllerOutputSpy

final class ArtistsViewControllerOutputSpy: ArtistsViewControllerOutput {

    var artists: [Artist]?
    var fetchArtistsCalled = false

    func fetchArtists() {

        fetchArtistsCalled = true
    }
}


// MARK: - ArtistsRouterInputSpy

final class ArtistsRouterProtocolSpy: ArtistsRouterProtocol {

    var navigateToArtistCalled = false

    weak var viewController: ArtistsViewController?


    func navigateToArtist(atIndexPath indexPath: IndexPath) {

        navigateToArtistCalled = true
    }
}
