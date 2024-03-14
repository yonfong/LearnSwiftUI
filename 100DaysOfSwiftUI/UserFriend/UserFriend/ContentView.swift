//
//  ContentView.swift
//  UserFriend
//
//  Created by sky on 2024/3/14.
//

import SwiftUI

struct ContentView: View {
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
        } catch {
            print(error.localizedDescription)
            print("Invalid data")
        }
    }
}

#Preview {
    ContentView()
}
