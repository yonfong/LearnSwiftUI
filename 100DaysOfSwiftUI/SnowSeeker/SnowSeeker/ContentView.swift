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
    
    @StateObject private var favorites = Favorites()
    
    let resorts:[Resort] = Bundle.main.decode("resorts.json")
    let sortTypes = ["default", "alphabetical", "country"]
    @State private var curSortType = "default"
    
    var filterdResorts:[Resort] {
        if searchText.isEmpty {
            switch curSortType {
            case "country":
                return resorts.sorted {$0.country > $1.country}
            case "alphabetical":
                return resorts.sorted {$0.name > $1.name}
            default:
                return resorts
            }
        } else {
            let filteredItems =  resorts.filter { $0.name.localizedCaseInsensitiveContains(searchText)}
            switch curSortType {
            case "country":
                return filteredItems.sorted {$0.country > $1.country}
            case "alphabetical":
                return filteredItems.sorted {$0.name > $1.name}
            default:
                return filteredItems
            }
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Section {
                    ForEach(filterdResorts) { resport in
                        NavigationLink(value: resport) {
                            HStack {
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
                                
                                if favorites.contains(resport) {
                                    Spacer()
                                    Image(systemName: "heart.fill")
                                        .accessibilityLabel("this is a favorite resort")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                    }
                } header: {
                    Picker("Sort", selection: $curSortType) {
                        ForEach(sortTypes, id: \.self) { sort in
                            Text(sort)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.vertical, 5)
                }
                .textCase(nil)
            }
            .navigationTitle("Resorts")
            .searchable(text: $searchText, prompt: "Search for a resort")
            .navigationDestination(for: Resort.self) { resort in
                ResortView(resort: resort)
            }
        } detail: {
            WelcomeView()
        }
        .environmentObject(favorites)
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
