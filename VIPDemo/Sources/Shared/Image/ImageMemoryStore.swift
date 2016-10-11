//
//  ImageMemoryStore.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 11/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation
import UIKit

/// _ImageMemoryStore_ is an image store backed by an in-memory cache

class ImageMemoryStore: ImageStoreProtocol {

    // TODO: use NSCache for memory management?

    fileprivate var cache = [String: UIImage]()


    /// Loads an image from the cache if found otherwise returns nil
    ///
    /// - parameter url:        The image URL
    /// - parameter completion: The closure to trigger when the image is found or not

    func loadImage(url: URL, completion: @escaping (UIImage?, Error?) -> ()) {

        let cacheKey = key(url: url)
        let image = cache[cacheKey]

        completion(image, nil)
    }
}


// MARK: - ImageStoreCaching

extension ImageMemoryStore: ImageStoreCaching {

    func saveImage(image: UIImage?, url: URL) {

        let cacheKey = key(url: url)
        cache[cacheKey] = image
    }

    func key(url: URL) -> String {

        return url.absoluteString
    }
}
