//
//  ContentView.swift
//  UserFriend
//
//  Created by sky on 2024/3/14.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query var localUsers: [User]
    @Environment(\.modelContext) var modelContext
    @State private var users = [User]()
    var body: some View {
        NavigationStack {
            UserListView(users: users)
                .task {
                    await loadUserData()
                }
        }
        .navigationTitle("User Challenge")
    }
    
    func loadUserData() async {
        guard localUsers.isEmpty else {
            users = localUsers
            return
        }
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid url")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let decodedResponse = try decoder.decode([User].self, from: data)
            
            users = decodedResponse
            for user in decodedResponse {
                modelContext.insert(user)
            }
        } catch {
            print(error.localizedDescription)
            print("Invalid data")
        }
    }
}

#Preview {
    ContentView()
}
