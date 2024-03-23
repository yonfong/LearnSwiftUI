//
//  ContentView.swift
//  HotProspects
//
//  Created by sky on 2024/3/22.
//

import SwiftUI
import UserNotifications
import SamplePackage

struct ContentView: View {
    let users = ["zhangsna", "lisi", "wangwu", "zhaoliu"]
    
//    @State private var selection: String?
    
    @State private var selectedTab = "One"
    
    @State private var selection = Set<String>()
    
    @State private var output = ""
    
    @State private var backgroundColor = Color.red
    
    let possibleNumbers = 1...60
    
    var results: String {
        let seleted = possibleNumbers.random(7).sorted()
        let strings = seleted.map(String.init)
        
        return strings.formatted()
    }
    
    var body: some View {
        
        TabView {
            ProspectsView(filter: .none)
                .tabItem {
                    Label("Everyone", systemImage: "person.3")
                }
            
            ProspectsView(filter: .contacted)
                .tabItem {
                    Label("Contacted", systemImage: "checkmark.circle")
                }
            
            ProspectsView(filter: .uncontacted)
                .tabItem {
                    Label("Uncontacted", systemImage: "questionmark.diamond")
                }
            
            MeView()
                .tabItem {
                    Label("Me", systemImage: "person.crop.square")
                }
        }
        
        
        
        
//        Text(results)
        
//        VStack {
//            Button("Request permission") {
//                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { sucess, error in
//                    if sucess {
//                        print("All set")
//                    } else if let error {
//                        print(error.localizedDescription)
//                    }
//                }
//            }
//            .padding()
//            
//            Button("Schedule Notification") {
//                let content = UNMutableNotificationContent()
//                content.title = "Feed the cat"
//                content.subtitle = "It looks hungry"
//                content.sound = UNNotificationSound.default
//                
//                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//                
//                UNUserNotificationCenter.current().add(request)
//            }
//            .padding()
//        }
        
        
        
//        List {
//            Text("Taylor swift")
//                .swipeActions {
//                    Button("Send message", systemImage: "message", role: .destructive) {
//                        print("Hi")
//                    }
//                }
//                .swipeActions(edge: .leading) {
//                    Button("Pin", systemImage: "pin") {
//                        print("Pinning")
//                    }
//                    .tint(.orange)
//                }
//        }
        
        
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
