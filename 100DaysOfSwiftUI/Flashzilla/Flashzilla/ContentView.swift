//
//  ContentView.swift
//  Flashzilla
//
//  Created by sky on 2024/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var currentAmount = 0.0
    @State private var finalAmount = 1.0
    
    @State private var currentAngle = Angle.zero
    @State private var finalAngle = Angle.zero
    
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    
    var body: some View {
        
        let dragGesture = DragGesture()
            .onChanged { offset = $0.translation }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }
        
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    isDragging = true
                }
            }
        let combined = pressGesture.sequenced(before: dragGesture)
        
        Circle()
            .fill(.red)
            .frame(width: 100, height: 100)
            .scaleEffect(isDragging ? 1.5 : 1.0)
            .offset(offset)
            .gesture(combined)
        
//        VStack {
//            Text("test rotate")
//                .frame(width: 300, height: 300)
//                .rotationEffect(currentAngle + finalAngle)
//                .gesture(
//                    RotateGesture()
//                        .onChanged({ value in
//                            currentAngle = value.rotation
//                        })
//                        .onEnded({ value in
//                            finalAngle += currentAngle
//                            currentAngle = .zero
//                        })
//                )
//            Text("Hello, world!")
//                .padding()
//                .onTapGesture(count: 2) {
//                    print("Double taped")
//                }
//                .onLongPressGesture(minimumDuration: 1) {
//                    print("Long pressed")
//                } onPressingChanged: { inProgress in
//                    print("in progress:\(inProgress)")
//                }
//            
//            Text("test gesture")
//                .scaleEffect(finalAmount + currentAmount)
//                .gesture(
//                    MagnifyGesture()
//                        .onChanged({ value in
//                            currentAmount = value.magnification - 1
//                        })
//                        .onEnded({ value in
//                            finalAmount += currentAmount
//                            currentAmount = 0
//                        })
//                )
//            
//            VStack {
//                Text("gesture clash")
//                    .padding()
//                    .onTapGesture {
//                        print("inner taped")
//                    }
//            }
////            .onTapGesture {
////                print("outer taped")
////            }
////            .highPriorityGesture(
////                TapGesture()
////                    .onEnded {
////                        print("outer taped")
////                    }
////            )
//            .simultaneousGesture(
//                TapGesture()
//                    .onEnded {
//                        print("outer taped")
//                    }
//            )
//        }
//        .padding()
    }
}

#Preview {
    ContentView()
}
