//
//  User.swift
//  SwiftDataProject
//
//  Created by sky on 2024/3/13.
//

import Foundation
import SwiftData

@Model
class User {
    var name: String
    var city: String
    var joinDate: Date
    @Relationship(deleteRule: .cascade) var jobs = [Job]()
    
    init(name: String, city: String, joinDate: Date, jobs: [Job] = [Job]()) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
        self.jobs = jobs
    }
}
