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

    static func fromJSON(json: [String: Any]) -> T?
}
