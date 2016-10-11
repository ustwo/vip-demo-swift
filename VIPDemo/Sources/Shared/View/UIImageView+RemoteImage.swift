//
//  UIImageView+RemoteImage.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 11/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation
import UIKit


extension UIImageView {

    func setImageURL(url: URL?, placeholder: UIImage? = nil) {

        guard let imageURL = url else {

            image = placeholder

            return
        }

        ImageManager.sharedInstance.loadImage(url: imageURL) { [weak self] image, error in

            if let strongSelf = self {

                strongSelf.image = image
            }
        }
    }
}
