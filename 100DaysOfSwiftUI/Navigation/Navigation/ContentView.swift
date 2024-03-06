//
//  ContentView.swift
//  Navigation
//
//  Created by sky on 2024/3/6.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                NavigationLink("Tap me") {
                    DetailView(number: i)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
