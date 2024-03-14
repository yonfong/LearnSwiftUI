//
//  UserFriendApp.swift
//  UserFriend
//
//  Created by sky on 2024/3/14.
//

import SwiftUI
import SwiftData

@main
struct UserFriendApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
