//
//  Response.swift
//  CupcakeCorner
//
//  Created by sky on 2024/3/8.
//

import Foundation

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}
