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
//        GeometryReaderView()
//        ScrollEffectView()
        
        CoverFlowView()
        
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

struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top")
            InnerView()
            Text("Bottom")
        }
    }
}

struct InnerView: View {
    var body: some View {
        HStack {
            Text("Left")
            GeometryReader{ proxy in
                Text("Center")
                    .background(.blue)
                    .onTapGesture {
                        print("Global center: \(proxy.frame(in: .global).midX) x \(proxy.frame(in: .global).midY)")
                        print("Custom center: \(proxy.frame(in: .named("Custom")).midX) x \(proxy.frame(in: .named("Custom")).midY)")
                        print("Local center: \(proxy.frame(in: .local).midX) x \(proxy.frame(in: .local).midY)")
                    }
            }
            .background(.orange)
            Text("Right")
        }
    }
}

struct CoverFlowView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(1..<20) { num in
                    GeometryReader { proxy in
                        Text("Number \(num)")
                            .font(.largeTitle)
                            .padding()
                            .background(.red)
                            .rotation3DEffect(.degrees(-proxy.frame(in: .global).minX) / 8, axis: (x: 0, y: 1, z: 0))
                            .frame(width: 200, height: 200)
                    }
                    .frame(width: 200, height: 200)
                }
            }
        }
    }
}

struct ScrollEffectView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    var body: some View {
        GeometryReader { fullView in
            ScrollView {
                ForEach(0..<50) { index in
                    GeometryReader { proxy in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(colors[index % 7])
                            .rotation3DEffect(
                                .degrees(proxy.frame(in: .global).minY - fullView.size.height / 2) / 5,
                                axis: (x: 0.0, y: 1.0, z: 0.0)
                            )
                    }
                    .frame(height: 40)
                }
            }
            
        }
    }
}

struct GeometryReaderView: View {
    var body: some View {
        OuterView()
            .background(.red)
            .coordinateSpace(name: "Custom")
        
        
//        VStack {
//            GeometryReader { proxy in
//                Text("hello, world")
//                    .frame(width: proxy.size.width * 0.9, height: 40)
//                    .background(.blue)
//            }
//            .background(.yellow)
//            
//            Text("More text")
//                .background(.red)
//        }
        
//        GeometryReader { proxy in
//            Image(.example)
//                .resizable()
//                .scaledToFit()
//                .frame(width: proxy.size.width * 0.8)
//                .background(.red)
//        }
//        
//        HStack {
//            Text("IMPORTANT")
//                .frame(width: 200)
//                .background(.blue)
//            
//            GeometryReader { proxy in
//                Image(.example)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: proxy.size.width * 0.8)
//                    .frame(width: proxy.size.width, height: proxy.size.height)
//                    .background(.yellow)
//            }
////            Image(.example)
////                .resizable()
////                .scaledToFit()
////                .containerRelativeFrame(.horizontal) { size, axis in
////                    size * 0.8
////                }
////                .background(.yellow)
//        }
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
