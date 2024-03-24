//
//  ContentView.swift
//  Flashzilla
//
//  Created by sky on 2024/3/24.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        CardView(card: Card.example)
    }
    
    func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
        if UIAccessibility.isReduceMotionEnabled {
            return try body()
        } else {
            return try withAnimation(animation, body)
        }
    }
    
}

#Preview {
    ContentView()
}
