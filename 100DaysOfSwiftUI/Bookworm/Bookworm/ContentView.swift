//
//  ContentView.swift
//  Bookworm
//
//  Created by sky on 2024/3/12.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var rememberMe = false
    
    @Query var students: [Student]
    @Environment(\.modelContext) var modelContext
    @Query var books: [Book]
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack {
            Text("Count: \(books.count)")
                .navigationTitle("Bookworm")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add Book", systemImage: "plus") {
                            showingAddScreen.toggle()
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen, content: {
                    AddBookView()
                })
            
        }
            
//            List(students) { student in
//                Text(student.name)
//            }
//            .navigationTitle("Classroom")
//            .toolbar {
//                Button("Add") {
//                    let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
//                    let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
//                    
//                    let chosenFirstName = firstNames.randomElement()!
//                    let chosenLastName = lastNames.randomElement()!
//                    
//                    let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
//                    modelContext.insert(student)
//                }
//            }
//        }
        
//        VStack {
//            PushButton(title: "Rembemr Me", isOn: $rememberMe)
//
//            Text(rememberMe ? "On" : "Off")
//        }
//        .padding()
    }
}

#Preview {
    ContentView()
}
