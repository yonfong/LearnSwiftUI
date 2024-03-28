//
//  ContentView.swift
//  MyBooks
//
//  Created by sky on 2024/3/27.
//

import SwiftUI
import SwiftData

enum SortOrder: String, Identifiable, CaseIterable {
    case status, title, author
    
    var id: Self {
        self
    }
}

struct BookListView: View {
    @State private var sortOrder = SortOrder.status
    @State private var createNewBook = false
    
    @State private var filter = ""
    var body: some View {
        NavigationStack {
            Picker("", selection: $sortOrder) {
                ForEach(SortOrder.allCases) { sortOrder in
                    Text("Sort by \(sortOrder.rawValue)").tag(sortOrder)
                }
            }
            .buttonStyle(.borderedProminent)
            BookList(sorOrder: sortOrder, filterString: filter)
                .searchable(text: $filter, prompt: Text("Filter on title or author"))
            .listStyle(.plain)
            .navigationTitle("My books")
            .toolbar {
                Button {
                    createNewBook = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .imageScale(.large)
                }
            }
            .sheet(isPresented: $createNewBook) {
                NewBookView()
                    .presentationDetents([.medium])
            }
        }
    }
}

#Preview {
    let preview = Preview(Book.self)
    preview.addExamples(Book.sampleBooks)
    return BookListView()
        .modelContainer(preview.container)
//        .modelContainer(for: Book.self, inMemory: true)
}
