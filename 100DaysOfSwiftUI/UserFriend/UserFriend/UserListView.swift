//
//  UserListView.swift
//  UserFriend
//
//  Created by sky on 2024/3/14.
//

import SwiftUI

struct UserListView: View {
    let users: [User]
    var body: some View {
        List {
            ForEach(users, id: \.id) { user in
                NavigationLink(value: user) {
                    HStack {
                        Text(user.name)
                            .font(.title)
                        Spacer()
                        Text(user.isActive ? "Active" : "InActive")
                            .foregroundStyle(user.isActive ? .red : .secondary)
                    }
                }
            }
        }
        .navigationDestination(for: User.self) { user in
            UserDetailView(user: user)
        }
    }
}

#Preview {
    UserListView(users: [User]())
}
