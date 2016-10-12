//
//  ArtistsRouterTests.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 11/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest
@testable import VIPDemo


// MARK: - ArtistsRouterTests

final class ArtistsRouterTests: XCTestCase {

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

    func testNavigateToArtistShouldDisplayArtistDetail() {

        // Given

        let viewController = ArtistsViewController()
        let navigationControllerSpy = NavigationControllerSpy(rootViewController: viewController)

        let url = URL(string: "http://test.com")

        let artist = Artist(mbid: "test mbid",
                            name: "test name",
                            playCount: "test playcount",
                            listeners: "test listeners",
                            url: url!,
                            imageURL: nil)

        let viewControllerOutputSpy = ArtistsViewControllerOutputSpy()
        viewControllerOutputSpy.artists = [artist]

        viewController.output = viewControllerOutputSpy

        let router = ArtistsRouter()
        router.viewController = viewController

        loadView(window: window, viewController: navigationControllerSpy)

        // When

        let indexPath = IndexPath(row: 0, section: 0)
        router.navigateToArtist(atIndexPath: indexPath)

        // Then

        XCTAssertEqual(navigationControllerSpy.viewControllers.count, 2)

        if let artistViewController = navigationControllerSpy.pushedViewController as? ArtistViewController {

            XCTAssertEqual(artistViewController.artist?.mbid, artist.mbid)
            XCTAssertEqual(artistViewController.artist?.name, artist.name)

        } else {

            XCTFail()
        }
    }

    func testNavigateToArtistShouldNotDisplayArtistDetailWhenIndexPathIsInvalid() {

        // Given

        let viewController = ArtistsViewController()
        let navigationControllerSpy = NavigationControllerSpy(rootViewController: viewController)

        let url = URL(string: "http://test.com")

        let artist = Artist(mbid: "test mbid",
                            name: "test name",
                            playCount: "test playcount",
                            listeners: "test listeners",
                            url: url!,
                            imageURL: nil)

        let viewControllerOutputSpy = ArtistsViewControllerOutputSpy()
        viewControllerOutputSpy.artists = [artist]

        viewController.output = viewControllerOutputSpy

        let router = ArtistsRouter()
        router.viewController = viewController

        loadView(window: window, viewController: navigationControllerSpy)

        // When

        let indexPath = IndexPath(row: 1, section: 0)
        router.navigateToArtist(atIndexPath: indexPath)

        // Then

        XCTAssertEqual(navigationControllerSpy.viewControllers.count, 1)

        guard let _ = navigationControllerSpy.pushedViewController as? ArtistsViewController else {

            XCTFail()

            return
        }
    }
}


// MARK: - NavigationControllerSpy

final class NavigationControllerSpy: UINavigationController {

    var pushedViewController: UIViewController?


    override func pushViewController(_ viewController: UIViewController, animated: Bool) {

        super.pushViewController(viewController, animated: animated)

        pushedViewController = viewController
    }
}
