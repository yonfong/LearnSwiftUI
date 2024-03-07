//
//  ContentView.swift
//  HabitTracking
//
//  Created by sky on 2024/3/7.
//

import SwiftUI

struct ContentView: View {
    @State private var habitTracking = HabitTracking()
    @State private var showCreateHabit = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(habitTracking.items) { item in
                    NavigationLink {
                        HabitDetailView(habitTracking: habitTracking, habitItem: item)
                    } label: {
                        HStack {
                            Text(item.title)
                            Spacer()
                            Text(item.description)
                        }
                    }
                    
                    
//                    NavigationLink(value: item) {
//                        HStack {
//                            Text(item.title)
//                            Spacer()
//                            Text(item.description)
//                        }
//                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Habit Tracking")
            .navigationDestination(for: HabitItem.self) { item in
                HabitDetailView(habitTracking: habitTracking, habitItem: item)
            }
            .toolbar {
                Button("Create Habit", systemImage:"plus") {
                    showCreateHabit = true
                }
            }
            .sheet(isPresented: $showCreateHabit, content: {
                let item = HabitItem(title: "", description: "")
                HabitDetailView(habitTracking: habitTracking, habitItem: item)
            })
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        habitTracking.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
