//
//  ContentView.swift
//  BetterRest
//
//  Created by sky on 2024/2/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sleepCount = 8.0
    
    var body: some View {
        VStack {
            Stepper("\(sleepCount.formatted()) hours", value: $sleepCount, in: 4...12, step: 0.25)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
