//
//  Quote.swift
//  MyBooks
//
//  Created by sky on 2024/3/28.
//

import Foundation
import SwiftData

@Model
class Quote {
    var creationDate = Date.now
    var text: String
    var page: String?
    
    init(text: String, page: String? = nil) {
        self.text = text
        self.page = page
    }
    
    var book: Book?
}
