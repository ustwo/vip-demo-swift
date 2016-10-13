//
//  AlbumWorkerTests.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 11/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest
@testable import VIPDemo

final class AlbumWorkerTests: XCTestCase {


    // MARK: - Tests

    func testFetchAlbumsShouldFetchAlbumsFromStore() {

        // Given

        let store = AlbumsStoreSpy()
        let worker = AlbumWorker(store: store)

        // When

        worker.fetchAlbums(artistId: "") { albums, error in
        }

        // Then

        XCTAssertTrue(store.fetchAlbumsCalled)
    }
}


// MARK: - AlbumsStoreSpy

final class AlbumsStoreSpy: AlbumsStoreProtocol {

    var fetchAlbumsCalled = false

    func fetchAlbums(artistId: String, completion: @escaping ([Album]?, Error?) -> ()) {

        fetchAlbumsCalled = true

        completion(nil, nil)
    }
}
