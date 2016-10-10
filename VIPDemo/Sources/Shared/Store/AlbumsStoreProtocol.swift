//
//  AlbumsStoreProtocol.swift
//  VIPDemo
//
//  Created by Daniela Dias on 10/10/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


// MARK: - AlbumsStoreError

enum AlbumsStoreError: Error {

    case generic
    case invalidURL
    case invalidResponse
}


// MARK: - AlbumsStoreProtocol

protocol AlbumsStoreProtocol {

    func fetchAlbums(artistId: String, completion: @escaping ([Album], Error?) -> ())
}
