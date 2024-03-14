//
//  AddView.swift
//  iExpense
//
//  Created by sky on 2024/3/2.
//

import SwiftUI
import SwiftData

struct AddView: View {
    @State private var name: String = ""
    @State private var type: String = "Personal"
    @State private var amount = 0.0
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    let types = ["Business", "Personal"]
    
    var isSaveInValid: Bool {
        return name.isEmpty || (amount.isNaN || amount == 0.0)
    }
    
//    var expenses: Expenses
    
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
//            .navigationTitle($name)
            .navigationTitle("Create Item")
            .navigationBarTitleDisplayMode(.inline)
//            .navigationBarBackButtonHidden()
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
//                    expenses.items.append(item)
                    
                    modelContext.insert(item)
                    dismiss()
                }
                .disabled(isSaveInValid)
            }
        }
    }
}

#Preview {
    AddView()
//    AddView(expenses: Expenses())
}
