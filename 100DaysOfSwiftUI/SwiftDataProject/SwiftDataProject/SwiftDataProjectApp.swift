//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by sky on 2024/3/13.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
