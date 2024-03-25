//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by sky on 2024/3/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        CustomAlignmentGuideView()
//        AbsolutePositioningView()
        GeometryReaderView()
        
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//                .padding(20)
//                .background(.red)
//        }
//        .padding()
        
//        HStack(alignment: .lastTextBaseline) {
//            Text("Live")
//                .font(.caption)
//            Text("long")
//            Text("and")
//                .font(.title)
//            Text("prosper")
//                .font(.largeTitle)
//        }
//        
//        VStack(alignment: .leading) {
//            Text("holly wow")
//                .alignmentGuide(.leading, computeValue: { dimension in
//                    dimension[.trailing]
//                })
//            Text("this is a long line of text")
//        }
//        .background(.red)
//        .frame(width: 400, height: 400)
//        .background(.blue)
//        
//        VStack(alignment: .leading) {
//                ForEach(0..<10) { position in
//                    Text("Number \(position)")
//                        .alignmentGuide(.leading) { _ in Double(position) * -10 }
//                }
//            }
//            .background(.red)
//            .frame(width: 400, height: 400)
//            .background(.blue)
    }
}

#Preview {
    ContentView()
}

struct GeometryReaderView: View {
    var body: some View {
        GeometryReader { proxy in
            Image(.example)
                .resizable()
                .scaledToFit()
                .frame(width: proxy.size.width * 0.8)
                .background(.red)
        }
        
        HStack {
            Text("IMPORTANT")
                .frame(width: 200)
                .background(.blue)
            
            GeometryReader { proxy in
                Image(.example)
                    .resizable()
                    .scaledToFit()
                    .frame(width: proxy.size.width * 0.8)
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .background(.yellow)
            }
//            Image(.example)
//                .resizable()
//                .scaledToFit()
//                .containerRelativeFrame(.horizontal) { size, axis in
//                    size * 0.8
//                }
//                .background(.yellow)
        }
    }
}

struct AbsolutePositioningView: View {
    var body: some View {
        Text("hello, world")
            .offset(x: 100, y: 100)
            .background(.red)
    }
}

struct CustomAlignmentGuideView: View {
    var body: some View {
        HStack(alignment: .midAcountAndName) {
            VStack {
                Text("@twostraws")
                    .alignmentGuide(.midAcountAndName, computeValue: { dimension in
                        dimension[VerticalAlignment.center]
                    })
                Image(.example)
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            
            VStack {
                Text("FULL NAME")
                Text("PAUL HUDSON")
                    .alignmentGuide(.midAcountAndName, computeValue: { dimension in
                        dimension[VerticalAlignment.center]
                    })
                    .font(.largeTitle)
            }
        }
    }
}

extension VerticalAlignment {
    struct MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    
    static let midAcountAndName = VerticalAlignment(MidAccountAndName.self)
}
