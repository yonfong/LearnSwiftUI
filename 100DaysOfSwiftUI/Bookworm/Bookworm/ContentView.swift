//
//  ContentView.swift
//  Bookworm
//
//  Created by sky on 2024/3/12.
//

import SwiftUI

struct ContentView: View {
    @State private var rememberMe = false
    var body: some View {
        VStack {
            PushButton(title: "Rembemr Me", isOn: $rememberMe)
            
            Text(rememberMe ? "On" : "Off")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
