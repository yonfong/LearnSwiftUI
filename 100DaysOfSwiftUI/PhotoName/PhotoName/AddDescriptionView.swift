//
//  AddPersonView.swift
//  PhotoName
//
//  Created by sky on 2024/3/18.
//

import SwiftUI
import PhotosUI
import SwiftData

struct AddDescriptionView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State private var name = ""
    
    var imageData: Data
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("enter name of photo", text: $name)
                    .padding()
                Spacer()
            }
            .toolbar {
                Button("save", action: save)
                    .disabled(name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
    }
    
    private func save() {
        let item = PhotoItem(name: name, photo: imageData)
        
        modelContext.insert(item)
        
        dismiss()
    }
}

//#Preview {
//    AddPersonView()
//}
