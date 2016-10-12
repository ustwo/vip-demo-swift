//
//  ArtistPresenterTests.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 11/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest
@testable import VIPDemo


// MARK: - ArtistPresenterTests

final class ArtistPresenterTests: XCTestCase {


    // MARK: - Tests

    func testPresentAlbumsShouldFormatFetchedAlbumsForDisplay() {

        // Given

        let outputSpy = ArtistPresenterOutputSpy()

        let presenter = ArtistPresenter()
        presenter.output = outputSpy

        let url = URL(string: "http://test.com")
        let imageUrl = URL(string: "http://imagetest.com")

        let album = Album(mbid: "test mbid", name: "test name", url: url!, imageURL: imageUrl)

        // When

        presenter.presentAlbums(albums: [album])

        // Then

        XCTAssertEqual(outputSpy.albumsViewModels.count, 1)
        XCTAssertEqual(outputSpy.albumsViewModels[0].title, "test name")
        XCTAssertEqual(outputSpy.albumsViewModels[0].imageURL?.absoluteString, "http://imagetest.com")
    }

    func testPresentAlbumsShouldDisplayAlbums() {

        // Given

        let outputSpy = ArtistPresenterOutputSpy()

        let presenter = ArtistPresenter()
        presenter.output = outputSpy

        let url = URL(string: "http://test.com")
        let imageUrl = URL(string: "http://imagetest.com")

        let album = Album(mbid: "test mbid", name: "test name", url: url!, imageURL: imageUrl)

        // When

        presenter.presentAlbums(albums: [album])

        // Then

        XCTAssertTrue(outputSpy.displayAlbumsCalled)
    }

    func testPresentAlbumsShouldFormatFetchedErrorForDisplay() {

        // Given

        let outputSpy = ArtistPresenterOutputSpy()

        let presenter = ArtistPresenter()
        presenter.output = outputSpy

        // When

        presenter.presentError(error: AlbumsStoreError.invalidResponse)

        // Then

        XCTAssertEqual(outputSpy.errorViewModel?.title, Strings.Error.genericTitle)
        XCTAssertEqual(outputSpy.errorViewModel?.message, Strings.Error.genericMessage)
    }

    func testPresentAlbumsShouldDisplayError() {

        // Given

        let outputSpy = ArtistPresenterOutputSpy()

        let presenter = ArtistPresenter()
        presenter.output = outputSpy

        // When

        presenter.presentError(error: AlbumsStoreError.invalidResponse)

        // Then

        XCTAssertTrue(outputSpy.displayErrorCalled)
    }
}


// MARK: - ArtistPresenterOutputSpy

final class ArtistPresenterOutputSpy: ArtistPresenterOutput {

    var displayAlbumsCalled = false
    var displayErrorCalled = false

    var albumsViewModels = [AlbumViewModel]()
    var errorViewModel: ErrorViewModel?


    func displayError(viewModel: ErrorViewModel) {

        errorViewModel = viewModel

        displayErrorCalled = true
    }

    func displayAlbums(viewModels: [AlbumViewModel]) {

        albumsViewModels = viewModels
        
        displayAlbumsCalled = true
    }
}
