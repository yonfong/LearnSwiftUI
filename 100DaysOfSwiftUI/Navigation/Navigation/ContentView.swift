//
//  ContentView.swift
//  Navigation
//
//  Created by sky on 2024/3/6.
//

import SwiftUI

struct ContentView: View {
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button("show 32") {
                    path = [32]
                }
                
                Button("show 64") {
                    path.append(64)
                }
                
                Button("show 32 then 64") {
                    path = [32, 64]
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
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
