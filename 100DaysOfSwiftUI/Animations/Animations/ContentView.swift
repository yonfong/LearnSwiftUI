//
//  ContentView.swift
//  Animations
//
//  Created by sky on 2024/2/24.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        print(animationAmount)
        return VStack {
            Stepper("scale amount", value: $animationAmount.animation(
                .easeInOut(duration: 1)
                .repeatCount(3, autoreverses: true)
            ), in: 1...10)
            
            Spacer()
            Button("Tap me") {
                animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
//            .overlay(
//                Circle()
//                    .stroke(.red)
//                    .scaleEffect(animationAmount)
//                    .opacity(2 - animationAmount)
//                    .animation(
//                        .easeInOut(duration: 1)
//                        .repeatForever(autoreverses: false),
//                        value: animationAmount)
//            )
//            .onAppear {
//                animationAmount = 2
//            }
        }
    }
}

#Preview {
    ContentView()
}
