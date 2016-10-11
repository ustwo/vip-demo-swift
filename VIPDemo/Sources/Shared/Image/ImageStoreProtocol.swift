//
//  ImageStore.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 11/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation
import UIKit


/// _ImageStoreProtocol_ is a protocol for image loading behaviours

protocol ImageStoreProtocol {

    /// Loads an image from the store given a URL
    ///
    /// - parameter url:        The URL of the image to load
    /// - parameter completion: The closure to trigger when the image loading completes

    func loadImage(url: URL, completion: @escaping (UIImage?, Error?) -> ())
}
