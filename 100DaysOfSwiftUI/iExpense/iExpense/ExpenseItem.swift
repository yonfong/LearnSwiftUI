//
//  ExpenseItem.swift
//  iExpense
//
//  Created by sky on 2024/3/2.
//

import Foundation

struct ExpenseItem {
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]()
}
