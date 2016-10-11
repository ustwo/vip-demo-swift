//
//  ImageStoreCaching.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 11/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation
import UIKit


/// _ImageStoreCaching_ is a protocol for image caching behaviours

protocol ImageStoreCaching {

    /// Saves an image to the cache
    ///
    /// - parameter image: The image to cache
    /// - parameter url:   The image URL

    func saveImage(image: UIImage?, url: URL)

    /// Creates a key for the cache from a URL
    ///
    /// - parameter url: The image URL
    ///
    /// - returns: A string suitable for use as a cache key

    func key(url: URL) -> String
}
