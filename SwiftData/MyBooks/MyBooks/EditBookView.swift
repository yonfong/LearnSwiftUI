//
//  EditBookView.swift
//  MyBooks
//
//  Created by sky on 2024/3/27.
//

import SwiftUI
import SwiftData

struct EditBookView: View {
    @Environment(\.dismiss) private var dismiss
    let book: Book
    @State private var status = Status.onShelf
    @State private var rating: Int?
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var summary: String = ""
    @State private var dateAdded: Date = Date.now
    @State private var dateStarted: Date = Date.distantPast
    @State private var dateCompleted: Date = Date.distantPast
    
    @State private var firstView = true
    
    var body: some View {
        HStack {
            Text("Status")
            Picker("Status", selection: $status) {
                ForEach(Status.allCases) { status in
                    Text(status.descr).tag(status)
                }
            }
            .buttonStyle(.bordered)
        }
        VStack(alignment: .leading) {
            GroupBox {
                LabeledContent {
                    DatePicker("", selection: $dateAdded, displayedComponents: .date)
                } label: {
                    Text("Date Added")
                }

                if status == .inProgress || status == .completed {
                    LabeledContent {
                        DatePicker("", selection: $dateStarted, in:dateAdded..., displayedComponents: .date)
                    } label: {
                        Text("Date Started")
                    }
                }
                
                if  status == .completed {
                    LabeledContent {
                        DatePicker("", selection: $dateStarted, in: dateStarted..., displayedComponents: .date)
                    } label: {
                        Text("Date Completed")
                    }
                }
            }
            .foregroundStyle(.secondary)
            .onChange(of: status) { oldValue, newValue in
                if !firstView {
                    if newValue == .onShelf {
                        dateStarted = Date.distantPast
                        dateCompleted = Date.distantPast
                    } else if newValue == .inProgress && oldValue == .completed {
                        dateCompleted = Date.distantPast
                    } else if newValue == .inProgress && oldValue == .onShelf {
                        dateStarted = .now
                    } else if newValue == .completed && oldValue == .onShelf {
                        dateCompleted = .now
                        dateStarted = dateAdded
                    } else {
                        dateCompleted = .now
                    }
                    
                    firstView = false
                }
            }
            Divider()
            LabeledContent {
                RatingsView(maxRating: 5, currentRating: $rating, width: 30)
            } label: {
                Text("Rating")
            }
            LabeledContent {
                TextField("", text: $title)
            } label: {
                Text("Title")
                    .foregroundStyle(.secondary)
            }
            LabeledContent {
                TextField("", text: $author)
            } label: {
                Text("Author")
            }
            Divider()
            Text("Summary").foregroundStyle(.secondary)
            TextEditor(text: $summary)
                .padding(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(uiColor: .tertiarySystemFill), lineWidth: 2)
                )
        }
        .padding()
        .textFieldStyle(.roundedBorder)
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if changed {
                Button("Update") {
                    book.status = status
                    book.rating = rating
                    book.title = title
                    book.author = author
                    book.summary = summary
                    book.dateAdded = dateAdded
                    book.dateStarted = dateStarted
                    book.dateCompleted = dateCompleted
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .onAppear {
            status = book.status
            rating = book.rating
            title = book.title
            author = book.author
            summary = book.summary
            dateAdded = book.dateAdded
            dateStarted = book.dateStarted
            dateCompleted = book.dateCompleted
        }
    }
    
    var changed: Bool {
        status != book.status
        || rating != book.rating
        || title != book.title
        || author != book.author
        || summary != book.summary
        || dateAdded != book.dateAdded
        || dateStarted != book.dateStarted
        || dateCompleted != book.dateCompleted
    }
}

#Preview {
    let preview = Preview(Book.self)
    return NavigationStack {
        EditBookView(book: Book.sampleBooks[3])
            .modelContainer(preview.container)
    }
}