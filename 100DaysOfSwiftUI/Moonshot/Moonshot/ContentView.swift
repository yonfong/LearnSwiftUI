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
//        NavigationStack {
//            NavigationLink {
//                Text("Detail View")
//            } label: {
//                VStack {
//                    Text("This is the label")
//                    Text("so is this")
//                    Image(systemName: "face.smiling")
//                }
//                .font(.largeTitle)
//            }
//            NavigationLink("Tap me") {
//                Text("Detail view")
//            }
//            .navigationTitle("Swift UI")
//        }
        
        NavigationStack {
            List(0..<100) { row in
                NavigationLink("Row \(row)") {
                    Text("Detail \(row)")
                }
            }
            .navigationTitle("Swift UI")
        }
        
//        ScrollView(.horizontal) {
//            LazyHStack(spacing: 10) {
//                ForEach(0..<100) {
//                    CustomText("item \($0)")
//                        .font(.title)
//                }
//            }
////            .frame(maxWidth: .infinity)
//        }
    }
}

#Preview {
    ContentView()
}
