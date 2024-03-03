//
//  ContentView.swift
//  Moonshot
//
//  Created by sky on 2024/3/2.
//

import SwiftUI

struct CustomText: View {
    let text: String
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}


struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("item \($0)")
                        .font(.title)
                }
            }
//            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    ContentView()
}
