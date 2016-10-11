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

    fileprivate var imageCache = [String: UIImage]()


    // MARK: - Initializers

    init() {

        NotificationCenter.default.addObserver(self, selector: #selector(handleMemoryNotification), name: .UIApplicationDidReceiveMemoryWarning, object: nil)
    }

    deinit {

        NotificationCenter.default.removeObserver(self, name: .UIApplicationDidReceiveMemoryWarning, object: nil)
    }

    /// Loads an image from the cache if found otherwise returns nil
    ///
    /// - parameter url:        The image URL
    /// - parameter completion: The closure to trigger when the image is found or not

    func loadImage(url: URL, completion: @escaping (UIImage?, Error?) -> ()) {

        let cacheKey = key(url: url)
        let image = imageCache[cacheKey]

        completion(image, nil)
    }

    /// Saves an image to the cache
    ///
    /// - parameter image: The image to save (cache)
    /// - parameter url:   The URL of the image (used as a key)

    func saveImage(image: UIImage?, url: URL) {

        let cacheKey = key(url: url)
        imageCache[cacheKey] = image
    }


    /// Removes all images from the memory cache

    func removeAllImages() {

        self.imageCache.removeAll()
    }


    // MARK: - Private

    private func key(url: URL) -> String {

        return url.absoluteString
    }


    // MARK: - Notifications

    @objc func handleMemoryNotification() {

        self.removeAllImages()
    }
}
