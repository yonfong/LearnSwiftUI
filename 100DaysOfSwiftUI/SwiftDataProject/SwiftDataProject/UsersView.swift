//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by sky on 2024/3/14.
//

import SwiftUI
import SwiftData

struct UsersView: View {
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]
    
    var body: some View {
        List() {
            ForEach(users) { user in
                HStack {
                    Text(user.name)
                    Spacer()
                    if !user.jobs.isEmpty {
                        VStack {
                            ForEach(user.jobs) { job in
                                Text(job.name)
                            }
                        }
                    }
                    
//                    Text(String(user.jobs.count))
//                        .fontWeight(.black)
//                        .padding(.horizontal, 10)
//                        .padding(.vertical, 5)
//                        .background(.blue)
//                        .foregroundStyle(.white)
//                        .clipShape(.capsule)
                }
            }
            .onDelete(perform: deleteItems)
        }
    }
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
    
    func deleteItems(as offsets: IndexSet) {
        for offset in offsets {
            let user = users[offset]
            modelContext.delete(user)
        }
    }
}

#Preview {
    UsersView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\User.name)])
        .modelContainer(for: User.self)
}
