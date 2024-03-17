//
//  Result.swift
//  BucketList
//
//  Created by sky on 2024/3/17.
//

import Foundation

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages:[Int: Page]
}

struct Page: Codable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
}
