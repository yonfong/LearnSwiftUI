//
//  Location.swift
//  BucketList
//
//  Created by sky on 2024/3/17.
//

import Foundation

struct Location: Codable, Equatable, Identifiable {
    let id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
}
