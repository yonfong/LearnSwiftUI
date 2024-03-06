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
                NavigationLink("Select \(i)", value: i)
            }
            .navigationDestination(for: Int.self) { selection in
                DetailView(number: selection)
            }
        }
    }
}

#Preview {
    ContentView()
}
