//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by sky on 2024/2/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Button("Delete Selection", action: executeDelete)
                
                Button("Delete Selection", role: .destructive, action: executeDelete)
            }
            
            VStack {
                Button("Button 1"){}
                    .buttonStyle(.bordered)
                Button("Button 2", role: .destructive) {}
                    .buttonStyle(.bordered)
                Button("Button 3"){}
                    .buttonStyle(.borderedProminent)
                Button("Button 2", role: .destructive) {}
                    .buttonStyle(.borderedProminent)
                    .tint(.mint)
                Button {
                    print("Buttons was tapped")
                } label: {
                    Text("Tap me!")
                        .padding()
                        .foregroundStyle(.white)
                        .background(.red)
                }
                
                Button {
                    print("Edit button was tapped")
                } label: {
                    Image(systemName: "pencil")
                        .padding()
                        .background(.red)
                }
                Button("Edit", systemImage: "pencil") {
                    print("Edit button taped")
                }
                Button {
                    print("Edit button was tapped")
                } label: {
                    Label("Edit", systemImage: "pencil")
                        .padding()
                        .foregroundStyle(.white)
                        .background(.red)
                }
                
                Button {
                    print("test")
                } label: {
                    HStack {
                        Text("Edit")
                        Image(systemName: "pencil")
                    }
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
                }
            }
        }
    }
    
    func executeDelete() {
        print("Now deleting")
    }
}

#Preview {
    ContentView()
}
