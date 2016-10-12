//
//  ArtistConfiguratorTests.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 11/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest
@testable import VIPDemo


// MARK: - ArtistConfiguratorTests

final class ArtistConfiguratorTests: XCTestCase {


    // MARK: - Tests

    func testConfigureShouldSetViewControllerRouter() {

        // Given

        let url = URL(string: "http://test.com")

        let artist = Artist(mbid: "test mbid",
                            name: "test name",
                            playCount: "test playcount",
                            listeners: "test listeners",
                            url: url!,
                            imageURL: nil)

        let viewController = ArtistViewController(artist: artist)

        // When

        ArtistConfigurator.sharedInstance.configure(viewController: viewController)

        // Then

        XCTAssertNotNil(viewController.router)
    }

    func testConfigureShouldSetViewControllerOutput() {

        // Given

        let url = URL(string: "http://test.com")

        let artist = Artist(mbid: "test mbid",
                            name: "test name",
                            playCount: "test playcount",
                            listeners: "test listeners",
                            url: url!,
                            imageURL: nil)

        let viewController = ArtistViewController(artist: artist)

        // When

        ArtistConfigurator.sharedInstance.configure(viewController: viewController)

        // Then

        XCTAssertNotNil(viewController.output)
    }

    func testConfigureShouldSetInteractorOutput() {

        // Given

        let url = URL(string: "http://test.com")

        let artist = Artist(mbid: "test mbid",
                            name: "test name",
                            playCount: "test playcount",
                            listeners: "test listeners",
                            url: url!,
                            imageURL: nil)

        let viewController = ArtistViewController(artist: artist)

        // When

        ArtistConfigurator.sharedInstance.configure(viewController: viewController)

        // Then

        if let interactor = viewController.output as? ArtistInteractor {

            XCTAssertNotNil(interactor.output)

        } else {

            XCTFail()
        }
    }

    func testConfigureShouldSetPresenterOutput() {

        // Given

        let url = URL(string: "http://test.com")

        let artist = Artist(mbid: "test mbid",
                            name: "test name",
                            playCount: "test playcount",
                            listeners: "test listeners",
                            url: url!,
                            imageURL: nil)

        let viewController = ArtistViewController(artist: artist)

        // When

        ArtistConfigurator.sharedInstance.configure(viewController: viewController)

        // Then

        if let interactor = viewController.output as? ArtistInteractor,
            let presenter = interactor.output as? ArtistPresenter {

            XCTAssertNotNil(presenter.output)

        } else {

            XCTFail()
        }
    }

    func testConfigureShouldSetRouterViewController() {

        // Given

        let url = URL(string: "http://test.com")

        let artist = Artist(mbid: "test mbid",
                            name: "test name",
                            playCount: "test playcount",
                            listeners: "test listeners",
                            url: url!,
                            imageURL: nil)

        let viewController = ArtistViewController(artist: artist)

        // When

        ArtistConfigurator.sharedInstance.configure(viewController: viewController)

        // Then

        XCTAssertEqual(viewController.router.viewController, viewController)
    }
}
