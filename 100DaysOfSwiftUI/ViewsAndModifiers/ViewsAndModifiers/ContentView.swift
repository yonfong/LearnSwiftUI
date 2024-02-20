//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by sky on 2024/2/19.
//

import SwiftUI


struct CapsuleText: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(.capsule)
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct ProminentTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.blue)
    }
}

extension View {
    func prominentTitleStyle() -> some View {
        modifier(ProminentTitle())
    }
}

struct ContentView: View {
    
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titllandus")
    
    var body: some View {
//        VStack {
//            motto1
//                .foregroundStyle(.red)
//            motto2
//                .foregroundStyle(.blue)
//        }
        
        Text("Title")
            .prominentTitleStyle()
        
        GrideStack(rows: 4, columns: 4) { row, col in
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)")
        }
        VStack(spacing: 10) {
            CapsuleText(text: "First")
                .foregroundStyle(.yellow)
            CapsuleText(text: "Second")
                .foregroundStyle(.red)
            Text("Hello world")
                .modifier(Title())
            Text("entension modifier")
                .titleStyle()
            Color.blue
                .frame(width: 300, height: 300)
                .watermarked(with: "Hacking with swift")
        }
    }
}

#Preview {
    ContentView()
}
