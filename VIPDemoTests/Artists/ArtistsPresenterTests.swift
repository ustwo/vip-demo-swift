//
//  ArtistsPresenterTests.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 11/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest
@testable import VIPDemo


// MARK: - ArtistsPresenterTests

final class ArtistsPresenterTests: XCTestCase {


    // MARK: - Tests

    func testPresentArtistsShouldFormatFetchedArtistsForDisplay() {

        // Given

        let outputSpy = ArtistsPresenterOutputSpy()
        let presenter = ArtistsPresenter(output: outputSpy)

        let url = URL(string: "http://test.com")
        let imageUrl = URL(string: "http://imagetest.com")

        let artist = Artist(mbid: "test mbid",
                            name: "test name",
                            playCount: "test playcount",
                            listeners: "test listeners",
                            url: url!,
                            imageURL: imageUrl)

        // When

        presenter.presentArtists(artists: [artist])

        // Then

        XCTAssertEqual(outputSpy.artistsViewModels.count, 1)
        XCTAssertEqual(outputSpy.artistsViewModels[0].title, "test name")
        XCTAssertEqual(outputSpy.artistsViewModels[0].imageURL?.absoluteString, "http://imagetest.com")
    }

    func testPresentArtistsShouldDisplayArtists() {

        // Given

        let outputSpy = ArtistsPresenterOutputSpy()
        let presenter = ArtistsPresenter(output: outputSpy)

        let url = URL(string: "http://test.com")
        let imageUrl = URL(string: "http://imagetest.com")

        let artist = Artist(mbid: "test mbid",
                            name: "test name",
                            playCount: "test playcount",
                            listeners: "test listeners",
                            url: url!,
                            imageURL: imageUrl)

        // When

        presenter.presentArtists(artists: [artist])

        // Then

        XCTAssertTrue(outputSpy.displayArtistsCalled)
    }

    func testPresentArtistsShouldFormatFetchedErrorForDisplay() {

        // Given

        let outputSpy = ArtistsPresenterOutputSpy()
        let presenter = ArtistsPresenter(output: outputSpy)

        // When

        presenter.presentError(error: ArtistsStoreError.invalidResponse)

        // Then

        XCTAssertEqual(outputSpy.errorViewModel?.title, Strings.Error.genericTitle)
        XCTAssertEqual(outputSpy.errorViewModel?.message, Strings.Error.genericMessage)
    }

    func testPresentArtistsShouldDisplayError() {

        // Given

        let outputSpy = ArtistsPresenterOutputSpy()
        let presenter = ArtistsPresenter(output: outputSpy)

        // When

        presenter.presentError(error: ArtistsStoreError.invalidResponse)

        // Then

        XCTAssertTrue(outputSpy.displayErrorCalled)
    }
}


// MARK: - ArtistsPresenterOutputSpy

final class ArtistsPresenterOutputSpy: ArtistsPresenterOutput {

    var displayArtistsCalled = false
    var displayErrorCalled = false

    var artistsViewModels = [ArtistViewModel]()
    var errorViewModel: ErrorViewModel?


    func displayError(viewModel: ErrorViewModel) {

        errorViewModel = viewModel

        displayErrorCalled = true
    }

    func displayArtists(viewModels: [ArtistViewModel]) {

        artistsViewModels = viewModels

        displayArtistsCalled = true
    }
}
