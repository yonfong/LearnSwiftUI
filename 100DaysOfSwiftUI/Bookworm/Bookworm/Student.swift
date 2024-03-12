//
//  Student.swift
//  Bookworm
//
//  Created by sky on 2024/3/12.
//

import Foundation
import SwiftData

@Model
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
