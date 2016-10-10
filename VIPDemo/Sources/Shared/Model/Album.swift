//
//  Album.swift
//  VIPDemo
//
//  Created by Daniela Dias on 10/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


// MARK: - Artist

struct Album {

    let mbid: String
    let name: String
    let url: URL
    let imageURL: URL?
}


// MARK: - Parsable

extension Album : Parsable {

    private struct Constants {

        static let mbidKey = "mbid"
        static let nameKey = "name"
        static let urlKey = "url"
        static let imageKey = "image"
        static let imageSizeKey = "size"
        static let imageSizeValue = "large"
        static let imageURLKey = "#text"
    }


    static func fromJSON(json: [String: Any]) -> Album? {

        if let mbid = json[Constants.mbidKey] as? String,
            let name = json[Constants.nameKey] as? String,
            let urlString = json[Constants.urlKey] as? String,
            let url = URL(string: urlString) {

            var imageURL: URL?

            // Parse images array. Each image is a dictionary in the array with url and size string

            if let imagesArray = json[Constants.imageKey] as? [[String: Any]] {

                let imageURLs = imagesArray.flatMap { (imageDictionary) -> URL? in

                    if let imageSize = imageDictionary[Constants.imageSizeKey] as? String, imageSize == Constants.imageSizeValue,
                        let imageURLString = imageDictionary[Constants.imageURLKey] as? String {

                        return URL(string: imageURLString)
                    }

                    return nil
                }

                imageURL = imageURLs.first

            }

            return Album(mbid: mbid, name: name, url: url, imageURL: imageURL)
        }

        return nil
    }
}
