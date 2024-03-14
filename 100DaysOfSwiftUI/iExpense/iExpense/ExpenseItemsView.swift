//
//  ExpenseItemsView.swift
//  iExpense
//
//  Created by sky on 2024/3/14.
//

import SwiftUI
import SwiftData

struct ExpenseItemsView: View {
    @Environment(\.modelContext) var modelContext
    @Query var items: [ExpenseItem]
    
    var body: some View {
        List {
            Section {
                ForEach(items) { item in
                    NavigationLink(value: item) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            
                            Spacer()
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
        }
    }
    
    init(type: String, sortOrder:[SortDescriptor<ExpenseItem>]) {
        _items = Query(filter: #Predicate<ExpenseItem> { item in
            item.type == type
        }, sort: sortOrder)
    }
    
    func removeItems(at offsets: IndexSet) {
        for offset in offsets {
            let item = items[offset]
            modelContext.delete(item)
        }
    }
}

#Preview {
    ExpenseItemsView(type: "Business", sortOrder: [SortDescriptor(\ExpenseItem.name)])
        .modelContainer(for: ExpenseItem.self)
}
