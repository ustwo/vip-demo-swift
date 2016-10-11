//
//  NetworkClient.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 06/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


// MARK: - NetworkError

enum NetworkError: Error {

    case generic
    case invalidURL
}


// MARK: - NetworkClientProtocol

protocol NetworkClientProtocol {

    func sendRequest(request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> ())
}


// MARK: - NetworkClient

class NetworkClient: NetworkClientProtocol {

    static let sharedInstance = NetworkClient()

    let session: URLSession!


    // MARK: - Initialisers

    init() {

        let configuration = URLSessionConfiguration.default
        configuration.urlCache = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
        configuration.timeoutIntervalForRequest = 8.0

        session = URLSession(configuration: configuration)
    }


    // MARK: - Send requests

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
