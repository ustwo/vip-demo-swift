//
//  ImageManager.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 11/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation
import UIKit


/// _ImageManager_ is a singleton for loading images from memory cache, disk cache or network

class ImageManager {

    static let sharedInstance = ImageManager()

    private let memoryStore = ImageMemoryStore()
    private let networkStore = ImageNetworkStore()

    var updateNetworkStatusActivityIndicator: Bool = true

    /// Loads an image from memory cache or the network if not cached
    ///
    /// - parameter url:        The image URL
    /// - parameter completion: The closure to trigger when the image has been loaded

    func loadImage(url: URL, completion: @escaping (UIImage?, Error?) -> ()) {

        memoryStore.loadImage(url: url) { [weak self] cachedImage, memoryStoreError in

            if let strongSelf = self {

                if let _ = cachedImage {

                    completion(cachedImage, nil)

                } else {

                    strongSelf.setNetworkActivityIndicatorVisible(visible: true)
                    strongSelf.networkStore.loadImage(url: url, completion: { downloadedImage, networkStoreError in

                        strongSelf.setNetworkActivityIndicatorVisible(visible: false)
                        strongSelf.memoryStore.saveImage(image: downloadedImage, url: url)

                        completion(downloadedImage, networkStoreError)
                    })
                }
            }
        }
    }


    /// Clears all images from all caches

    func clearCache() {

        memoryStore.removeAllImages()
    }


    // MARK: - Private

    private func setNetworkActivityIndicatorVisible(visible: Bool) {

        if updateNetworkStatusActivityIndicator {

            UIApplication.shared.isNetworkActivityIndicatorVisible = visible
        }
    }
}
