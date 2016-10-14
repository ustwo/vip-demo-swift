//
//  NetworkClient.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 06/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


// MARK: - NetworkError

/// _NetworkError_ is an enumeration that specifies network errors
///
/// - generic:    Generic error
/// - invalidURL: Invalid URL error
enum NetworkError: Error {

    case generic
    case invalidURL
}


// MARK: - NetworkClientProtocol

/// _NetworkClientProtocol_ is a protocol specifies send network requests behaviour
protocol NetworkClientProtocol {

    func sendRequest(request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> ())
}


// MARK: - NetworkClient

/// _NetworkClient_ is a class responsible for network requests
class NetworkClient: NetworkClientProtocol {

    static let sharedInstance = NetworkClient()

    let session: URLSession!


    // MARK: - Initialisers

    /// Initializes an instance of _NetworkClient_
    ///
    /// - returns: The instance of _NetworkClient_
    init() {

        let configuration = URLSessionConfiguration.default
        configuration.urlCache = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
        configuration.timeoutIntervalForRequest = 5.0

        session = URLSession(configuration: configuration)
    }


    // MARK: - Send requests

    /// Sends a URL request
    ///
    /// - parameter request:    The URL request
    /// - parameter completion: The completion block
    func sendRequest(request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {

        guard let url = request.url else {

            completion(nil, nil, NetworkError.invalidURL)
            return
        }

        session.dataTask(with: url) { data, response, error in

            DispatchQueue.main.async {

                completion(data, response, error)
            }

        }.resume()
    }
}
