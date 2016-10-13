//
//  Strings.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 07/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


/// _Strings_ is a struct responsible to hold all the strings in this application
struct Strings {

    struct Artists {

        static let screenTitle = NSLocalizedString("Top Artists", comment: "Top Artists screen title")
    }

    struct Artist {

        static let screenTitle = NSLocalizedString("Artist", comment: "Artist screen title")
        static let albumsTitle = NSLocalizedString("Top Albums", comment: "Artist header title")
    }

    struct Error {

        static let genericTitle = NSLocalizedString("Sorry", comment: "Generic error title")
        static let genericMessage = NSLocalizedString("Something went wrong.", comment: "Generic error message")
        static let okButtonTitle = NSLocalizedString("Ok", comment: "Alert button title")
    }
}
