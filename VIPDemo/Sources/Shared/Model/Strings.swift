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

        static let screenTitle = Strings.localizedString(key: "Top 50 Artists")
    }

    private static func localizedString(key: String) -> String {

        return NSLocalizedString(key, comment: "")
    }
}
