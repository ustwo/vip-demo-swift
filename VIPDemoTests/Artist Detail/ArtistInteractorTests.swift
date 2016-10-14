//
//  ArtistInteractorTests.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 11/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest
@testable import VIPDemo


// MARK: - ArtistInteractorTests

final class ArtistInteractorTests: XCTestCase {


    // MARK: - Tests

    func testFetchAlbumsShouldAskAlbumWorkerToFetchAlbums() {

        // Given

        let interactorOutputSpy = ArtistInteractorOutputSpy()
        let workerSpy = AlbumWorkerSpy()

        let interactor = ArtistInteractor(output: interactorOutputSpy, worker: workerSpy)

        // When

        interactor.fetchAlbums(artistId: "")

        // Then

        XCTAssertTrue(workerSpy.fetchAlbumsCalled)
    }

    func testFetchAlbumsShouldAskPresenterToFormatResult() {

        // Given

        let interactorOutputSpy = ArtistInteractorOutputSpy()
        let workerSpy = AlbumWorkerSpy()

        let interactor = ArtistInteractor(output: interactorOutputSpy, worker: workerSpy)

        // When

        interactor.fetchAlbums(artistId: "")

        // Then

        XCTAssertTrue(interactorOutputSpy.presentAlbumsCalled)
        XCTAssertFalse(interactorOutputSpy.presentErrorCalled)
    }

    func testFetchAlbumsShouldAskPresenterToPresentErrorIfError() {

        // Given

        let interactorOutputSpy = ArtistInteractorOutputSpy()
        let workerSpy = AlbumWorkerSpy()
        workerSpy.fetchAlbumsError = true

        let interactor = ArtistInteractor(output: interactorOutputSpy, worker: workerSpy)

        // When

        interactor.fetchAlbums(artistId: "")

        // Then

        XCTAssertTrue(interactorOutputSpy.presentErrorCalled)
        XCTAssertFalse(interactorOutputSpy.presentAlbumsCalled)
    }
}


// MARK: - AlbumWorkerSpy

final class AlbumWorkerSpy: AlbumWorker {

    var fetchAlbumsCalled = false

    var fetchAlbumsError = false

    enum AlbumsWorkerSpyError: Error {

        case generic
    }


    override func fetchAlbums(artistId: String, completion: @escaping ([Album], Error?) -> ()) {

        fetchAlbumsCalled = true

        if fetchAlbumsError {

            completion([], AlbumsWorkerSpyError.generic)

        } else {

            completion([], nil)
        }
    }
}


// MARK: - ArtistInteractorOutputSpy

final class ArtistInteractorOutputSpy: ArtistInteractorOutput {

    var presentErrorCalled = false
    var presentAlbumsCalled = false

    func presentError(error: Error) {

        presentErrorCalled = true
    }

    func presentAlbums(albums: [Album]) {

        presentAlbumsCalled = true
    }
}
