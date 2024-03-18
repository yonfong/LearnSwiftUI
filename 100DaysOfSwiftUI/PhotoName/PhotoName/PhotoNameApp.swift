//
//  PhotoNameApp.swift
//  PhotoName
//
//  Created by sky on 2024/3/17.
//

import SwiftUI
import SwiftData

@main
struct PhotoNameApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: PhotoItem.self)
    }
}
