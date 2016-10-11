//
//  ArtistsViewControllerTests.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 11/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest
@testable import VIPDemo

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

    func testInitShouldConfigureScene() {

        // Given

        let configuratorSpy = ArtistsConfiguratorSpy()

        // When

        let _ = ArtistsViewController(configurator: configuratorSpy)

        // Then

        XCTAssertTrue(configuratorSpy.configureCalled)
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


    }

    func testViewDidLoadShouldSetupTableViewDataSource() {


    }

    func testViewDidLoadShouldSetupTableViewDelegate() {


    }

    func testNumberOfSectionsInTableViewShouldAlwaysBeOne() {


    }

    func testNumberOfRowsInAnySectionShouldEqualNumberOfArtistsToDisplay() {


    }

    func testCellForRowAtIndexShouldConfigureTableViewCellToDisplayArtist() {


    }

    func testDidSelectRowAtIndexShouldNavigateToArtist() {


    }

    func testRefreshShouldFetchArtists() {


    }


    // MARK: - Templates

    func testMethodShouldBlahWhenBlah() {


    }

    func testScenariohouldBlahWhenBlah() {


    }
}

final class ArtistsViewControllerOutputSpy: ArtistsViewControllerOutput {

    var artists: [Artist]?
    var fetchArtistsCalled: Bool = false

    func fetchArtists() {

        fetchArtistsCalled = true
    }
}

final class ArtistsConfiguratorSpy: ArtistsConfigurator {

    var configureCalled = false

    override func configure(viewController: ArtistsViewController) {

        super.configure(viewController: viewController)

        configureCalled = true
    }
}
