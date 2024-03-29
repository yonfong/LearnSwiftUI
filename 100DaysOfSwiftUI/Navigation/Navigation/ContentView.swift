//
//  ContentView.swift
//  Navigation
//
//  Created by sky on 2024/3/6.
//

import SwiftUI

struct ContentView: View {
    @State private var pathStore = PathStore()
    
    @State private var title = "Swift UI"
    
    var body: some View {
        NavigationStack {
            Text("hello world")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
        }
        
        
        
        
//        NavigationStack {
//            List(0..<100) { index in
//                Text("Row \(index)")
//            }
//            .navigationTitle("Title goes here")
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbarBackground(.blue)
//            .toolbarColorScheme(.dark)
//            .toolbar {
////                ToolbarItem(placement: .topBarLeading) {
////                    Button("Tap me") {
////                        
////                    }
////                }
////                
////                ToolbarItem(placement: .topBarLeading) {
////                    Button("Or Tap me") {
////                        
////                    }
////                }
//                ToolbarItemGroup(placement: .topBarLeading) {
//                    Button("Tap me") {
//                    
//                    }
//                    
//                    Button("Or Tap me") {
//                    
//                    }
//                }
//            }
////            .toolbar(.hidden, for: .navigationBar)
//        }
        
        
//        NavigationStack(path: $pathStore.path) {
////            List {
////                ForEach(0..<5) { i in
////                    NavigationLink("Select number \(i)", value: i)
////                }
////                
////                ForEach(0..<5) { i in
////                    NavigationLink("Select string \(i)", value: String(i))
////                }
////            }
//            DetailView(number: 0, path: $pathStore.path)
//            .navigationDestination(for: Int.self) { selection in
//                DetailView(number: selection, path: $pathStore.path)
//            }
//            .navigationDestination(for: String.self) { selection in
//                Text("You selected string \(selection)")
//            }
//            .toolbar {
//                Button("push 565") {
//                    pathStore.path.append(565)
//                }
//                
//                Button("push hello") {
//                    pathStore.path.append("hello")
//                }
//            }
//        }
//        NavigationStack {
//            List(0..<100) { i in
//                NavigationLink("Select \(i)", value: i)
//            }
//            .navigationDestination(for: Int.self) { selection in
//                DetailView(number: selection)
//            }
//        }
    }
}

#Preview {
    ContentView()
}
