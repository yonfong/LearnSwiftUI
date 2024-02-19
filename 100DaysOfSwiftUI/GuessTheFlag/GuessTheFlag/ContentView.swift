//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by sky on 2024/2/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        ZStack {
//            VStack(spacing: 0) {
//                Color.red
//                Color.blue
//            }
//            Text("Your content")
//                .foregroundStyle(.secondary)
//                .padding(50)
//                .background(.ultraThinMaterial)
//        }
//        .ignoresSafeArea()
        VStack {
            LinearGradient(stops: [
                Gradient.Stop(color: .white, location: 0.45),
                Gradient.Stop(color: .black, location: 0.55)], startPoint: .top, endPoint: .bottom)
            RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
            AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
            Text("Your content")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(.white)
                .background(.red.gradient)
        }
    }
}

#Preview {
    ContentView()
}
