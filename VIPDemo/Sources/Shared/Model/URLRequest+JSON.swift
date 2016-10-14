//
//  URLRequest+JSON.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 11/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


/// Extension of _URLRequest_ to create a request for accepting and sending JSON data
extension URLRequest {

    /// Creates a new URLRequest with JSON accept and content-type
    ///
    /// - parameter url: The URL of the request to download
    ///
    /// - returns: A new URLRequest instance
    static func jsonRequest(url: URL) -> URLRequest {

        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        return request
    }
}
