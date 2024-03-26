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
    
    let resorts:[Resort] = Bundle.main.decode("resorts.json")
    var body: some View {
        NavigationSplitView {
            List(resorts) { resport in
                NavigationLink {
                    Text(resport.name)
                } label: {
                    Image(resport.country)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 25)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 5)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 1)
                        )
                    
                    VStack(alignment: .leading, content: {
                        Text(resport.name)
                            .font(.headline)
                        
                        Text("\(resport.runs) runs")
                    })
                }
            }
            .navigationTitle("Resorts")
        } detail: {
            WelcomeView()
        }
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
