//
//  AlbumsAPIStoreTests.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 11/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest
@testable import VIPDemo


// MARK: - AlbumsAPIStoreTests

final class AlbumsAPIStoreTests: XCTestCase {


    // MARK: - Tests

    func testFetchAlbumsShouldSendTopArtistAlbumsRequest() {

        // Given

        let networkClientSpy = AlbumsNetworkClientSpy()

        let store = AlbumsAPIStore(networkClient: networkClientSpy)

        // When

        let artistId = "cc197bad-dc9c-440d-a5b5-d52ba2e14234"

        store.fetchAlbums(artistId: artistId) { album, error in
        }

        // Then

        XCTAssertTrue(networkClientSpy.sendRequestCalled)
    }

    func testFetchAlbumsShouldReturnTopAlbums() {

        // Given

        let networkClientSpy = AlbumsNetworkClientSpy()

        let store = AlbumsAPIStore(networkClient: networkClientSpy)

        // When

        let artistId = "cc197bad-dc9c-440d-a5b5-d52ba2e14234"

        let expectationFetchAlbums = expectation(description: "fetchAlbums")

        store.fetchAlbums(artistId: artistId) { albums, error in

            if albums?.count == 5
                && error == nil {

                expectationFetchAlbums.fulfill()
            }
        }

        // Then

        waitForExpectations(timeout: 0.1, handler: nil)
    }

    func testFetchAlbumsShouldReturnError() {

        // Given

        let networkClientSpy = AlbumsNetworkClientErrorSpy()

        let store = AlbumsAPIStore(networkClient: networkClientSpy)

        // When

        let artistId = "cc197bad-dc9c-440d-a5b5-d52ba2e14234"

        let expectationFetchAlbums = expectation(description: "fetchAlbums")

        store.fetchAlbums(artistId: artistId) { albums, error in

            if albums == nil
                && error != nil {

                expectationFetchAlbums.fulfill()
            }
        }

        // Then

        waitForExpectations(timeout: 0.1, handler: nil)
    }
}


// MARK: - AlbumsNetworkClientSpy

final class AlbumsNetworkClientSpy: NetworkClientProtocol {

    var sendRequestCalled = false


    func sendRequest(request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {

        sendRequestCalled = true

        let bundle = Bundle(for: AlbumsAPIStoreTests.self)

        if let path = bundle.path(forResource: "top_albums", ofType: "json") {

            let url = URL(fileURLWithPath: path)

            do {

                let data = try Data(contentsOf: url, options: Data.ReadingOptions.mappedIfSafe)

                completion(data, nil, nil)

            } catch {

            }
        }
    }
}


// MARK: - AlbumsNetworkClientError

enum AlbumsNetworkClientError: Error {

    case generic
}


// MARK: - AlbumsNetworkClientErrorSpy

final class AlbumsNetworkClientErrorSpy: NetworkClientProtocol {

    var sendRequestCalled = false


    func sendRequest(request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {

        sendRequestCalled = true

        let error = AlbumsNetworkClientError.generic

        completion(nil, nil, error)
    }
}
