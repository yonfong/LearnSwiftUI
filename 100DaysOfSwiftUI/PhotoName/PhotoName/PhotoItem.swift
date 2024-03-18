//
//  PhotoItem.swift
//  PhotoName
//
//  Created by sky on 2024/3/18.
//

import Foundation
import SwiftData
import UIKit

@Model
class PhotoItem {
    var name: String
    
    @Attribute(.externalStorage) var photo: Data
    
    var image: UIImage {
        UIImage(data: photo)!
    }
    
    init(name: String, photo: Data) {
        self.name = name
        self.photo = photo
    }
}
