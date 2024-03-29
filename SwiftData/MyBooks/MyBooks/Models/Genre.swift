//
//  Genre.swift
//  MyBooks
//
//  Created by sky on 2024/3/28.
//

import SwiftUI
import SwiftData

@Model
class Genre {
    var name: String
    var color: String
    var books: [Book]?
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
    
    var hexColor: Color {
        Color(hex: self.color) ?? .red
    }
}
