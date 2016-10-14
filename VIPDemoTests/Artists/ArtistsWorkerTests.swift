//
//  ArtistsWorkerTests.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 11/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest
@testable import VIPDemo


// MARK: - ArtistsWorkerTests

final class ArtistsWorkerTests: XCTestCase {


    // MARK: - Tests

    func testFetchArtistsShouldFetchArtistsFromStore() {

        // Given

        let store = ArtistsStoreSpy()
        let worker = ArtistsWorker(store: store)

        // When

        worker.fetchArtists { artists, error in
        }

        // Then

        XCTAssertTrue(store.fetchArtistsCalled)
    }
}


// MARK: - ArtistsStoreSpy

final class ArtistsStoreSpy: ArtistsStoreProtocol {

    var fetchArtistsCalled = false

    func fetchArtists(completion: @escaping ([Artist]?, Error?) -> ()) {

        fetchArtistsCalled = true

        completion(nil, nil)
    }
}
