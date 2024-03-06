//
//  ContentView.swift
//  Navigation
//
//  Created by sky on 2024/3/6.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(0..<5) { i in
                    NavigationLink("Select number \(i)", value: i)
                }
                
                ForEach(0..<5) { i in
                    NavigationLink("Select string \(i)", value: String(i))
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected number \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("You selected string \(selection)")
            }
            .toolbar {
                Button("push 565") {
                    path.append(565)
                }
                
                Button("push hello") {
                    path.append("hello")
                }
            }
        }
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
