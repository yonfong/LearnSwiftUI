//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by sky on 2024/3/22.
//

import SwiftUI
import SwiftData

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
