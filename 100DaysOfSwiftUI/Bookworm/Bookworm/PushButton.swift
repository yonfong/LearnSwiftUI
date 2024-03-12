//
//  PushButton.swift
//  Bookworm
//
//  Created by sky on 2024/3/12.
//

import SwiftUI

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white:0.4)]
    
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationStack {
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
            
            
            Form {
                TextField("Enter your text", text: $notes, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .navigationTitle("Notes")
                    .padding()
                    .frame(maxHeight: 100)
                
                
            }
            
            Form {
                TextEditor(text: $notes)
                    .navigationTitle("Notes")
                    .padding()
            }
            
            TextField("Enter your text", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .navigationTitle("Notes")
                .padding()
                .frame(maxHeight: 100)
        }
        
        
        
//        Button(title) {
//            isOn.toggle()
//        }
//        .padding()
//        .background(LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
//        .foregroundStyle(.white)
//        .clipShape(.capsule)
//        .shadow(radius: isOn ? 0 : 5)
    }
}

#Preview {
    PushButton(title: "test", isOn: .constant(false))
}
