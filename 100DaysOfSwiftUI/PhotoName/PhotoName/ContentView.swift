//
//  ContentView.swift
//  PhotoName
//
//  Created by sky on 2024/3/17.
//

import SwiftUI
import SwiftData
import PhotosUI

struct ContentView: View {
    @Query(sort:\PhotoItem.name) var items: [PhotoItem]
    
    @State private var selectedItem: PhotosPickerItem?
    
    @State private var targetPhotoItem: PhotoItem?
    
    var body: some View {
        NavigationStack {
            List(items) { item in
                NavigationLink(value: item, label: {
                    HStack {
                        Image(uiImage: item.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                        
                        Spacer()
                        Text(item.name)
                    }
                })
            }
            .toolbar {
                PhotosPicker(selection: $selectedItem) {
                    Image(systemName: "plus")
                }
                .buttonStyle(.plain)
                .onChange(of: selectedItem, loadImage)
            }
            .sheet(item: $targetPhotoItem) { item in
                AddDescriptionView(imageData: item.photo)
            }
            .navigationDestination(for: PhotoItem.self) { item in
                PhotoDetailView(photoItem: item)
            }
        }
    }
    
    private func loadImage() {
        Task {
            guard let imageData = try? await selectedItem?.loadTransferable(type: Data.self) else {
                return
            }
            
            self.targetPhotoItem = PhotoItem(name: "", photo: imageData)
        }
    }
}

#Preview {
    ContentView()
}
