//
//  ContentView.swift
//  WordScramble
//
//  Created by sky on 2024/2/24.
//

import SwiftUI

struct ContentView: View {
    let people = ["Finn", "Leia", "Luke", "Rey", "Leia"]
    
    var body: some View {
        List(0..<5) {
            Text("Dynamic row \($0)")
        }
        
        List(people, id: \.self) {
            Text($0)
        }
    }
}

#Preview {
    ContentView()
}
