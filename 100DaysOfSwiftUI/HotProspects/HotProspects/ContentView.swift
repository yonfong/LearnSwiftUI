//
//  ContentView.swift
//  HotProspects
//
//  Created by sky on 2024/3/22.
//

import SwiftUI

struct ContentView: View {
    let users = ["zhangsna", "lisi", "wangwu", "zhaoliu"]
    
//    @State private var selection: String?
    
    @State private var selectedTab = "One"
    
    @State private var selection = Set<String>()
    
    @State private var output = ""
    
    @State private var backgroundColor = Color.red
    
    var body: some View {
        List {
            Text("Taylor swift")
                .swipeActions {
                    Button("Send message", systemImage: "message", role: .destructive) {
                        print("Hi")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button("Pin", systemImage: "pin") {
                        print("Pinning")
                    }
                    .tint(.orange)
                }
        }
        
        
//        VStack {
//            Text("Hellor, world")
//                .padding()
//                .background(backgroundColor)
//            
//            Text("Change color")
//                .padding()
//                .contextMenu {
//                    Button("Red", systemImage: "checkmark.circle.fill") {
//                        backgroundColor = .red
//                    }
//                    .foregroundStyle(.red)
//                    
//                    Button("Green") {
//                        backgroundColor = .green
//                    }
//                    
//                    Button("Blue") {
//                        backgroundColor = .blue
//                    }
//                }
//                
//            
//            Image(.example)
//                .interpolation(.none)
//                .resizable()
//                .scaledToFit()
//                .background(.black)
//            
//            Text(output)
//                .task {
//                    await fetchReadings()
//                }
//        }
        
        
//        TabView(selection: $selectedTab) {
//            VStack {
//                Text("Tab 1")
//                
//                Button("Show tab 2") {
//                    selectedTab = "Two"
//                }
//            }
//            .tabItem {
//                Label("One", systemImage: "star")
//            }
//            .tag("One")
//            
//            Text("Tab 2")
//                .tabItem {
//                    Label("Two", systemImage: "circle")
//                }
//                .tag("Two")
//        }
        
//        List(users, id: \.self, selection: $selection) { user in
//            Text(user)
//        }
//        
//        if  !selection.isEmpty {
//            Text("You slected \(selection.formatted())")
//        }
//        EditButton()
    }
    
    func fetchReadings() async {
//        do {
//            let url = URL(string: "https://hws.dev/readings.json")!
//            let (data, _) = try await URLSession.shared.data(from: url)
//            
//            let readings = try JSONDecoder().decode([Double].self, from: data)
//            
//            output = "found \(readings.count) readings"
//        } catch {
//            print("Download error")
//        }
        
        let fetchTask = Task {
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)

            return "found \(readings.count) readings"
        }
        
        let result = await fetchTask.result
        
        switch result {
        case .success(let str):
            output = str
        case .failure(let error):
            output = "Error: \(error.localizedDescription)"
        }
    }
}

#Preview {
    ContentView()
}
