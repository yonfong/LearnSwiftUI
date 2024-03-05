//
//  AddView.swift
//  iExpense
//
//  Created by sky on 2024/3/2.
//

import SwiftUI

struct AddView: View {
    @State private var name: String = ""
    @State private var type: String = "Personal"
    @State private var amount = 0.0
    
    @Environment(\.dismiss) var dismiss
    
    let types = ["Business", "Personal"]
    
    var expenses: Expenses
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}