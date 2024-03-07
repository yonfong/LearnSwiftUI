//
//  HabitItem.swift
//  HabitTracking
//
//  Created by sky on 2024/3/7.
//

import Foundation
import Observation

struct HabitItem: Identifiable, Codable, Hashable {
    var id = UUID()
    var title: String
    var description: String
}

@Observable
class HabitTracking {
    var items = [HabitItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "HabitTracking-items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "HabitTracking-items") {
            if let decodedItems = try? JSONDecoder().decode([HabitItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}
