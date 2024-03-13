//
//  BookwormApp.swift
//  Bookworm
//
//  Created by sky on 2024/3/12.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
