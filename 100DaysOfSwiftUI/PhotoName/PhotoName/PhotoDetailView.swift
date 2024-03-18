//
//  PhotoDetailView.swift
//  PhotoName
//
//  Created by sky on 2024/3/19.
//

import SwiftUI

struct PhotoDetailView: View {
    let photoItem: PhotoItem
    var body: some View {
        VStack {
            Image(uiImage: photoItem.image)
                .resizable()
                .scaledToFit()
        }
    }
}

//#Preview {
//    PhotoDetailView()
//}
