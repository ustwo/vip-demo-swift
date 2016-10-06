//
//  SerializableProtocol.swift
//  VIPDemo
//
//  Created by Daniela Dias on 06/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


// MARK: - Serializable

protocol Serializable {

    associatedtype T

    static func toJSON(_: T) -> [String: Any]
}
