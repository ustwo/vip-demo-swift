//
//  ArtistsAPIStoreTests.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 11/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest
@testable import VIPDemo


// MARK: - ArtistsAPIStoreTests

final class ArtistsAPIStoreTests: XCTestCase {


    // MARK: - Tests

    func testFetchArtistsShouldSendTopArtistsRequest() {

        // Given

        let networkClientSpy = NetworkClientSpy()

        let store = ArtistsAPIStore(networkClient: networkClientSpy)

        // When

        store.fetchArtists { (artists, error) in
        }

        // Then

        XCTAssertTrue(networkClientSpy.sendRequestCalled)
    }

    func testFetchArtistsShouldReturnTopArtists() {

        // Given

        let networkClientSpy = NetworkClientSpy()

        let store = ArtistsAPIStore(networkClient: networkClientSpy)

        // When

        let expectationFetchArtists = expectation(description: "fetchArtists")

        store.fetchArtists { (artists, error) in

            if artists.count == 2
                && error == nil {

                expectationFetchArtists.fulfill()
            }
        }

        // Then

        waitForExpectations(timeout: 0.1, handler: nil)
    }

    func testFetchArtistsShouldReturnError() {

        // Given

        let networkClientSpy = NetworkClientErrorSpy()

        let store = ArtistsAPIStore(networkClient: networkClientSpy)

        // When

        let expectationFetchArtists = expectation(description: "fetchArtists")

        store.fetchArtists { (artists, error) in

            if artists.count == 0
                && error != nil {

                expectationFetchArtists.fulfill()
            }
        }

        // Then

        waitForExpectations(timeout: 0.1, handler: nil)
    }
}


// MARK: - NetworkClientSpy

final class NetworkClientSpy: NetworkClientProtocol {

    var sendRequestCalled = false

    func sendRequest(request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {

        sendRequestCalled = true

        let bundle = Bundle(for: ArtistsAPIStoreTests.self)

        if let path = bundle.path(forResource: "top_artists", ofType: "json") {

            let url = URL(fileURLWithPath: path)

            do {

                let data = try Data(contentsOf: url, options: Data.ReadingOptions.mappedIfSafe)

                completion(data, nil, nil)

            } catch {

            }
        }
    }
}


// MARK: - NetworkClientError

enum NetworkClientError: Error {

    case generic
}


// MARK: - NetworkClientErrorSpy

final class NetworkClientErrorSpy: NetworkClientProtocol {

    var sendRequestCalled = false

    func sendRequest(request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {

        sendRequestCalled = true

        let error = NetworkClientError.generic

        completion(nil, nil, error)
    }
}
