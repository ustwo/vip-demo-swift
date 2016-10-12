//
//  ArtistsAPIStoreTests.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 11/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest
@testable import VIPDemo

final class ArtistsAPIStoreTests: XCTestCase {


    // MARK: - Tests

    func fetchArtistsShouldSendTopArtistsRequest() {

    }

    func fetchArtistsShouldReturnTopArtists() {

    }
}

final class NetworkClientSpy: NetworkClientProtocol {

    var sendRequestCalled = false

    func sendRequest(request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {

        sendRequestCalled = true

        // TODO return json
    }
}
