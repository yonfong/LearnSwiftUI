//
//  MyTodosApp.swift
//  MyTodos
//
//  Created by sky on 2024/3/30.
//

import SwiftUI

@main
struct MyTodosApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DataStore())
        }
    }
}
