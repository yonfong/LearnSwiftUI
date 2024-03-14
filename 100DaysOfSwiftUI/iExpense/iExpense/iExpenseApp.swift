//
//  iExpenseApp.swift
//  iExpense
//
//  Created by sky on 2024/3/2.
//

import SwiftUI
import SwiftData

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
