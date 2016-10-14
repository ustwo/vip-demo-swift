//
//  ArtistTests.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 11/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest
@testable import VIPDemo


// MARK: - ArtistTests

final class ArtistTests: XCTestCase {


    // MARK: - Tests

    func testFromJSONReturnsArtist() {

        // Given

        let bundle = Bundle(for: ArtistTests.self)
        let path = bundle.path(forResource: "artist", ofType: "json")!
        let url = URL(fileURLWithPath: path)

        do {

            let data = try Data(contentsOf: url, options: Data.ReadingOptions.mappedIfSafe)

            if let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {

                // When

                let artist = Artist.fromJSON(json: json)

                // Then

                XCTAssertEqual(artist?.mbid, "cc197bad-dc9c-440d-a5b5-d52ba2e14234")
                XCTAssertEqual(artist?.name, "Coldplay")
                XCTAssertEqual(artist?.playCount, "334356991")
                XCTAssertEqual(artist?.listeners, "5126338")
                XCTAssertEqual(artist?.url.absoluteString, "https://www.last.fm/music/Coldplay")
                XCTAssertEqual(artist?.imageURL?.absoluteString, "https://lastfm-img2.akamaized.net/i/u/300x300/0c057486667d4ec8ce07e1b964bce20c.png")

            } else {

                XCTFail()
            }

        } catch {

            XCTFail()
        }
    }
}
