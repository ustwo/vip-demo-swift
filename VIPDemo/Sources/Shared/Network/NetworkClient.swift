//
//  NetworkClient.swift
//  VIPDemo
//
//  Created by Shagun Madhikarmi on 06/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation

enum NetworkError: Error {

    case generic
    case invalidURL
}

protocol NetworkClientProtocol {

    func sendRequest(request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> ())
}

final class NetworkClient: NetworkClientProtocol {

    static let sharedInstance = NetworkClient()


    func sendRequest(request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {

        guard let url = request.url else {

            completion(nil, nil, NetworkError.invalidURL)
            return
        }

        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
