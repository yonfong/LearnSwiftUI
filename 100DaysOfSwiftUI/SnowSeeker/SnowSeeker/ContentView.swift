//
//  ContentView.swift
//  SnowSeeker
//
//  Created by sky on 2024/3/26.
//

import SwiftUI

struct User: Identifiable {
    var id = "fkldsjaflsa"
}


@Observable
class Player {
    var name = "fjldsajfl"
    var highScore = 0
}

struct PlayerView: View {
    @Environment(Player.self) var player
    var body: some View {
        Text("You hight score: \(player.highScore)")
    }
}

struct ContentView: View {
    @State private var selectedUser: User? = nil
    @State private var isShowingUser = false
    
    @State private var layoutVertically = false
    
    @Environment(\.horizontalSizeClass) var sizeClass
    
    @State private var searchText = ""
    
    let allNames = ["Subh", "Vina", "Melvin", "Stefanie"]

    var filteredNames:[String] {
        if searchText.isEmpty {
            return allNames
        } else {
            return allNames.filter{ $0.contains(searchText) }
        }
    }
    
    @State private var player = Player()
    
    var body: some View {
        VStack {
            Text("welcom")
            PlayerView()
        }
        .environment(player)
        
        
//        NavigationView {
//            List(filteredNames, id: \.self) { name in
//                Text(name)
//            }
//                .searchable(text: $searchText, prompt: "Look for something")
//                .navigationTitle("Searching")
//        }
        
        
//        Group {
//            if sizeClass == .compact {
//                VStack {
//                    TestGroupView()
//                }
//            } else {
//                HStack {
//                    TestGroupView()
//                }
//            }
//        }
//        .onTapGesture {
//            layoutVertically.toggle()
//        }
        
        
//        TestGroupView()
//        NavigationView {
//            NavigationLink {
//                Text("new secondary")
//            } label: {
//                Text("hello world")
//                    .onTapGesture {
//                        isShowingUser.toggle()
//                        selectedUser = User()
//                    }
//            }
//                .navigationTitle("primary")
////                .sheet(item: $selectedUser) { user in
////                    Text(user.id)
////                }
//                .alert("welcom", isPresented: $isShowingUser){}
//
//        }
    }
}




struct TestGroupView: View {
    var body: some View {
        Group {
            Text("zhangshan")
            Text("lisfdis")
            
            Text("wangwu")
            Text("zhaoliu")
        }
        .font(.title)
    }
}


#Preview {
    ContentView()
}
