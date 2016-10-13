//
//  ParsableProtocol.swift
//  VIPDemo
//
//  Created by Daniela Dias on 06/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


// MARK: - Parsable

/// _Parsable_ is a protocol to specify parsing behaviour
protocol Parsable {

    associatedtype T

    /// Converts a JSON dictionary into a generic object type T
    ///
    /// - parameter json: JSON dictionary
    ///
    /// - returns: The generic object type
    static func fromJSON(json: [String: Any]) -> T?
}
