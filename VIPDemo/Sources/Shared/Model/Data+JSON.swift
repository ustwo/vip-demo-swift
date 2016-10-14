//
//  Data+JSON.swift
//  VIPDemo
//
//  Created by Daniela Dias on 13/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


extension Data {

    /// Deserializing this data object into a json dictionary if possible
    ///
    /// - returns: The deserialized dictionary if possible, otherwise nil
    func jsonDictionary() -> [String: Any]? {

        do {

            let json = try JSONSerialization.jsonObject(with: self, options: .allowFragments) as? [String: Any]

            return json

        } catch {

            return nil
        }
    }
}
