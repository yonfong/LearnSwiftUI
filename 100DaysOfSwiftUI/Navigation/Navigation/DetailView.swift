//
//  DetailView.swift
//  Navigation
//
//  Created by sky on 2024/3/6.
//

import SwiftUI

struct DetailView: View {
    var number: Int
    @Binding var path: NavigationPath
    
    
    var body: some View {
        NavigationLink("go to random number", value: Int.random(in: 1...100))
            .navigationTitle("number: \(number)")
            .toolbar {
                Button("home") {
                    path = NavigationPath()
                }
            }
            .navigationBarBackButtonHidden()
    }
}

//#Preview {
//    DetailView(path: $NavigationPath(), number: 0)
//}
