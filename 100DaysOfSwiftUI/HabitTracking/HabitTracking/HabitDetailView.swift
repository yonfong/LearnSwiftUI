//
//  HabitDetailView.swift
//  HabitTracking
//
//  Created by sky on 2024/3/7.
//

import SwiftUI

struct HabitDetailView: View {
    var habitTracking: HabitTracking
    var habitItem: HabitItem? = nil 
    
    @State private var title = ""
    @State private var description = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Enter the habit title", text: $title)
                    TextField("Enter the habit description", text: $description)
                }
                
                HStack {
                    Text("you have complete ")
                    Spacer()
                    Button("ReComplete") {
                        
                    }
                }
            }
            .toolbar {
                Button("Save") {
                    save()
                    if habitItem == nil {
                        dismiss()
                    }
                }
            }
        }
    }
    
    init(habitTracking: HabitTracking, habitItem: HabitItem? = nil) {
        self.habitTracking = habitTracking
        self.habitItem = habitItem
        title = habitItem?.title ?? ""
        description = habitItem?.description ?? ""
    }
    
    
    private func save() {
        let targetItem = HabitItem(title: title, description: description)
        
        if let habitItem = habitItem, let idx = habitTracking.items.firstIndex(of: habitItem) {
            habitTracking.items[idx] = targetItem
        } else {
            habitTracking.items.append(targetItem)
        }
    }
}

#Preview {
    
    return HabitDetailView(habitTracking: HabitTracking())
}
