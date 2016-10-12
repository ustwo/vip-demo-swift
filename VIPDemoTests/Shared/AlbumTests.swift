//
//  AlbumTests.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 11/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest
@testable import VIPDemo


// MARK: - AlbumTests

final class AlbumTests: XCTestCase {


    // MARK: - Tests

    func testFromJSONReturnsAlbum() {

        // Given

        let bundle = Bundle(for: AlbumTests.self)
        let path = bundle.path(forResource: "album", ofType: "json")!
        let url = URL(fileURLWithPath: path)

        do {

            let data = try Data(contentsOf: url, options: Data.ReadingOptions.mappedIfSafe)

            if let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {

                // When

                let album = Album.fromJSON(json: json)

                // Then

                XCTAssertEqual(album?.mbid, "219b202d-290e-3960-b626-bf852a63bc50")
                XCTAssertEqual(album?.name, "A Rush of Blood to the Head")
                XCTAssertEqual(album?.url.absoluteString, "https://www.last.fm/music/Coldplay/A+Rush+of+Blood+to+the+Head")
                XCTAssertEqual(album?.imageURL?.absoluteString, "https://lastfm-img2.akamaized.net/i/u/174s/84d00c7ea1ec48ebc84cabae1bad75dc.png")

            } else {

                XCTFail()
            }

        } catch {

            XCTFail()
        }
    }
}
