//
//  ContentView.swift
//  iExpense
//
//  Created by sky on 2024/3/2.
//

import SwiftUI
import Observation
import SwiftData

//@Observable
//class User {
//    var firstName = "Bilbo"
//    var lastName = "Baggins"
//}

struct User: Codable {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    let name: String
    var body: some View {
        Text("Hello, \(name)")
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct ContentView: View {
//    @State private var user = User()
//    @State private var showingSheet = false
//    
//    @State private var numbers = [Int]()
//    @State private var currentNumber = 1
    
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    @AppStorage("tapCount") private var tapCount = 0
    
//    @State private var expenses = Expenses()
//    @State private var showingAddExpense = false
    
    @Environment(\.modelContext) var modelContext
//    @Query(sort: sortOrder) var items: [ExpenseItem]
    
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.name),
        SortDescriptor(\ExpenseItem.amount)
    ]
    
    var body: some View {
        NavigationStack {
            ExpenseItemsView(type: "Business", sortOrder: sortOrder)
            .navigationTitle("iExpense")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Sort By Name")
                                .tag([
                                    SortDescriptor(\ExpenseItem.name),
                                    SortDescriptor(\ExpenseItem.amount)
                                ])
                            
                            Text("Sort by Amount")
                                .tag([
                                    SortDescriptor(\ExpenseItem.amount),
                                    SortDescriptor(\ExpenseItem.name)
                                ])
                        }
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        AddView()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
//        .sheet(isPresented: $showingAddExpense, content: {
////            AddView(expenses: expenses)
//        })
        
        
        
//        VStack {
//            Text("Your name is \(user.firstName) \(user.lastName)")
//            
//            TextField("First name", text: $user.firstName)
//            TextField("Last name", text: $user.lastName)
//        }
//        
//        Button("save User") {
//            let encoder = JSONEncoder()
//            if let data = try? encoder.encode(user) {
//                UserDefaults.standard.set(data, forKey: "UserData")
//            }
//        }
        
        
//        Button("show sheet") {
//            showingSheet.toggle()
//        }
//        .sheet(isPresented: $showingSheet) {
//            SecondView(name: "@twostraws")
//        }
//        NavigationStack {
//            VStack {
//                List {
//                    ForEach(numbers, id: \.self) {
//                        Text("Row \($0)")
//                    }
//                    .onDelete(perform: removeRows)
//                }
//                
//                Button("Add Number") {
//                    numbers.append(currentNumber)
//                    currentNumber += 1
//                }
//            }
//            .toolbar {
//                EditButton()
//            }
//        }
        
//        Button("Tap count: \(tapCount)") {
//            tapCount += 1
////            UserDefaults.standard.set(tapCount, forKey: "Tap")
//        }
    }
    
}

#Preview {
    ContentView()
}
