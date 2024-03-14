//
//  UserDetailView.swift
//  UserFriend
//
//  Created by sky on 2024/3/14.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    var body: some View {
        List {
            Section {
                Text("age: \(user.age)")
                Text("address: \(user.address)")
                Text("registered: \(user.registered.formatted())")
            }
            
            Section("tags") {
                HStack {
                    ForEach(user.tags, id: \.self) { tag in
                        Text(tag)
                    }
                }
            }
            
            Section("Friends") {
                ForEach(user.friends, id: \.id) { friend in
                    Text(friend.name)
                }
            }
        }
        .navigationTitle(user.name)
    }
}

//#Preview {
//    UserDetailView()
//}
