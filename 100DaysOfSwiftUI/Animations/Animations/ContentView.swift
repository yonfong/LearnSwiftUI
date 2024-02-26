//
//  ContentView.swift
//  Animations
//
//  Created by sky on 2024/2/24.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.0
    @State private var enabled = false
    
    var body: some View {
        
        Button("Tap me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .animation(.default, value: enabled)
        .foregroundStyle(.white)
        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
        .animation(.spring(duration: 1, bounce: 0.6), value: enabled)
        
        
//        print(animationAmount)
//        return VStack {
//            Stepper("scale amount", value: $animationAmount.animation(
//                .easeInOut(duration: 1)
//                .repeatCount(3, autoreverses: true)
//            ), in: 1...10)
//            
//            Spacer()
//            Button("Tap me") {
//                animationAmount += 1
//            }
//            .padding(50)
//            .background(.red)
//            .foregroundStyle(.white)
//            .clipShape(.circle)
//            .scaleEffect(animationAmount)
////            .overlay(
////                Circle()
////                    .stroke(.red)
////                    .scaleEffect(animationAmount)
////                    .opacity(2 - animationAmount)
////                    .animation(
////                        .easeInOut(duration: 1)
////                        .repeatForever(autoreverses: false),
////                        value: animationAmount)
////            )
////            .onAppear {
////                animationAmount = 2
////            }
//        }
    }
}

#Preview {
    ContentView()
}
