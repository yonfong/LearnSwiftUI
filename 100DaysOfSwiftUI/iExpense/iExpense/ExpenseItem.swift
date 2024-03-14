//
//  ExpenseItem.swift
//  iExpense
//
//  Created by sky on 2024/3/2.
//

import Foundation
import SwiftData

@Model
class Expenses {
    var items = [ExpenseItem]()
    
    init(items: [ExpenseItem] = [ExpenseItem]()) {
        self.items = items
    }
}

@Model
class ExpenseItem {
    var id: UUID
    var name: String
    var type: String
    var amount: Double
    
    init(id: UUID = UUID(), name: String, type: String, amount: Double) {
        self.id = id
        self.name = name
        self.type = type
        self.amount = amount
    }
}

//struct ExpenseItem: Identifiable, Codable, Hashable {
//    var id: UUID = UUID()
//    let name: String
//    let type: String
//    let amount: Double
//}

//@Observable
//class Expenses {
//    var items = [ExpenseItem]() {
//        didSet {
//            if let encoded = try? JSONEncoder().encode(items) {
//                UserDefaults.standard.set(encoded, forKey: "Items")
//            }
//        }
//    }
//    
//    init() {
//        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
//            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
//                items = decodedItems
//                return
//            }
//        }
//        
//        items = []
//    }
//}
