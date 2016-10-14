//
//  ArtistsInteractorTests.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 11/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest
@testable import VIPDemo


// MARK: - ArtistsInteractorTests

final class ArtistsInteractorTests: XCTestCase {


    // MARK: - Tests

    func testFetchArtistsShouldAskArtistsWorkerToFetchArtists() {

        // Given

        let interactorOutputSpy = ArtistsInteractorOutputSpy()
        let workerSpy = ArtistsWorkerSpy()

        let interactor = ArtistsInteractor(output: interactorOutputSpy, worker: workerSpy)

        // When

        interactor.fetchArtists()

        // Then

        XCTAssertTrue(workerSpy.fetchArtistsCalled)
    }

    func testFetchArtistsShouldAskPresenterToFormatResult() {

        // Given

        let interactorOutputSpy = ArtistsInteractorOutputSpy()
        let workerSpy = ArtistsWorkerSpy()

        let interactor = ArtistsInteractor(output: interactorOutputSpy, worker: workerSpy)

        // When

        interactor.fetchArtists()

        // Then

        XCTAssertTrue(interactorOutputSpy.presentArtistsCalled)
        XCTAssertFalse(interactorOutputSpy.presentErrorCalled)
    }

    func testFetchArtistsShouldAskPresenterToPresentErrorIfError() {

        // Given

        let interactorOutputSpy = ArtistsInteractorOutputSpy()
        let workerSpy = ArtistsWorkerSpy()
        workerSpy.fetchArtistsError = true

        let interactor = ArtistsInteractor(output: interactorOutputSpy, worker: workerSpy)

        // When

        interactor.fetchArtists()

        // Then

        XCTAssertTrue(interactorOutputSpy.presentErrorCalled)
        XCTAssertFalse(interactorOutputSpy.presentArtistsCalled)
    }
}


// MARK: - ArtistsWorkerSpy

final class ArtistsWorkerSpy: ArtistsWorker {

    var fetchArtistsCalled = false

    var fetchArtistsError = false

    enum ArtistsWorkerSpyError: Error {

        case generic
    }

    override func fetchArtists(completion: @escaping ([Artist], Error?) -> ()) {

        fetchArtistsCalled = true

        if fetchArtistsError {

            completion([], ArtistsWorkerSpyError.generic)

        } else {

            completion([], nil)
        }
    }
}


// MARK: - ArtistsInteractorOutputSpy

final class ArtistsInteractorOutputSpy: ArtistsInteractorOutput {

    var presentErrorCalled = false
    var presentArtistsCalled = false

    func presentError(error: Error) {

        presentErrorCalled = true
    }

    func presentArtists(artists: [Artist]) {

        presentArtistsCalled = true
    }
}
