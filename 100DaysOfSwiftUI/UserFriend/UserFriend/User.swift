//
//  User.swift
//  UserFriend
//
//  Created by sky on 2024/3/14.
//

import Foundation

struct User: Codable, Hashable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags:[String]
    
    var friends:[Friend]
}

struct Friend: Codable, Hashable {
    var id: String
    var name: String
}
