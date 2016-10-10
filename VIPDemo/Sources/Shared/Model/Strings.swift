//
//  Strings.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 07/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation

struct Strings {

    struct Artists {

        static let screenTitle = Strings.localizedString(key: "Top Artists")
    }

    struct Artist {

        static let screenTitle = Strings.localizedString(key: "Artist")
        static let albumsTitle = Strings.localizedString(key: "Top Albums")
    }

    private static func localizedString(key: String) -> String {

        return NSLocalizedString(key, comment: "")
    }
}
