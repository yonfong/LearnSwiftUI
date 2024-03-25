//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by sky on 2024/3/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .padding(20)
                .background(.red)
        }
        .padding()
        
        HStack(alignment: .lastTextBaseline) {
            Text("Live")
                .font(.caption)
            Text("long")
            Text("and")
                .font(.title)
            Text("prosper")
                .font(.largeTitle)
        }
        
        VStack(alignment: .leading) {
            Text("holly wow")
                .alignmentGuide(.leading, computeValue: { dimension in
                    dimension[.trailing]
                })
            Text("this is a long line of text")
        }
        .background(.red)
        .frame(width: 400, height: 400)
        .background(.blue)
        
        VStack(alignment: .leading) {
                ForEach(0..<10) { position in
                    Text("Number \(position)")
                        .alignmentGuide(.leading) { _ in Double(position) * -10 }
                }
            }
            .background(.red)
            .frame(width: 400, height: 400)
            .background(.blue)
    }
}

#Preview {
    ContentView()
}
