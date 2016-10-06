//
//  ParsableProtocol.swift
//  VIPDemo
//
//  Created by Daniela Dias on 06/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


// MARK: - Parsable

protocol Parsable {

    associatedtype T

    static func fromJSON(json: [String: Any]) -> T?
}
