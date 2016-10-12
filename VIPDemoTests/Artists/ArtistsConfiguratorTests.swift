//
//  ArtistsConfiguratorTests.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 11/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest
@testable import VIPDemo

final class ArtistsConfiguratorTests: XCTestCase {


    // MARK: - Tests

    func testConfigureShouldSetViewControllerRouter() {

        // Given

        let viewController = ArtistsViewController()

        // When

        ArtistsConfigurator.sharedInstance.configure(viewController: viewController)

        // Then

        XCTAssertNotNil(viewController.router)
    }

    func testConfigureShouldSetViewControllerOutput() {

        // Given

        let viewController = ArtistsViewController()

        // When

        ArtistsConfigurator.sharedInstance.configure(viewController: viewController)

        // Then

        XCTAssertNotNil(viewController.output)
    }

    func testConfigureShouldSetInteractorOutput() {

        // Given

        let viewController = ArtistsViewController()

        // When

        ArtistsConfigurator.sharedInstance.configure(viewController: viewController)

        // Then

        if let interactor = viewController.output as? ArtistsInteractor {

            XCTAssertNotNil(interactor.output)

        } else {

            XCTFail()
        }
    }

    func testConfigureShouldSetPresenterOutput() {

        // Given

        let viewController = ArtistsViewController()

        // When

        ArtistsConfigurator.sharedInstance.configure(viewController: viewController)

        // Then

        if let interactor = viewController.output as? ArtistsInteractor,
            let presenter = interactor.output as? ArtistsPresenter {

            XCTAssertNotNil(presenter.output)

        } else {

            XCTFail()
        }
    }

    func testConfigureShouldSetRouterViewController() {

        // Given

        let viewController = ArtistsViewController()

        // When

        ArtistsConfigurator.sharedInstance.configure(viewController: viewController)

        // Then

        XCTAssertEqual(viewController.router.viewController, viewController)
    }
}
