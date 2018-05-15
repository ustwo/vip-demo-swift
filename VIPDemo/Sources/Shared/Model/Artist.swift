//
//  Artist.swift
//  VIPDemo
//
//  Created by Daniela Dias on 05/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


// MARK: - Artist

/// _Artist_ is a model representation of a music artist
struct Artist {

    let mbid: String
    let name: String
    let playCount: String
    let listeners: String
    let url: URL
    let imageURL: URL?
}


// MARK: - Parsable

extension Artist : Parsable {

    private struct Constants {

        static let mbidKey = "mbid"
        static let nameKey = "name"
        static let playCountKey = "playcount"
        static let listenersKey = "listeners"
        static let urlKey = "url"
        static let imageKey = "image"
        static let imageSizeKey = "size"
        static let imageSizeValue = "extralarge"
        static let imageURLKey = "#text"
    }


    static func fromJSON(json: [String: Any]) -> Artist? {

        if let mbid = json[Constants.mbidKey] as? String,
            let name = json[Constants.nameKey] as? String,
            let playCount = json[Constants.playCountKey] as? String,
            let listeners = json[Constants.listenersKey] as? String,
            let urlString = json[Constants.urlKey] as? String,
            let url = URL(string: urlString) {

            var imageURL: URL?

            // Parse images array. Each image is a dictionary in the array with url and size string

            if let imagesArray = json[Constants.imageKey] as? [[String: Any]] {

                let imageURLs = imagesArray.compactMap { (imageDictionary) -> URL? in

                    if let imageSize = imageDictionary[Constants.imageSizeKey] as? String, imageSize == Constants.imageSizeValue,
                        let imageURLString = imageDictionary[Constants.imageURLKey] as? String {

                        return URL(string: imageURLString)
                    }

                    return nil
                }

                imageURL = imageURLs.first

            }

            return Artist(mbid: mbid, name: name, playCount: playCount, listeners: listeners, url: url, imageURL: imageURL)
        }

        return nil
    }
}
