//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by sky on 2024/3/13.
//

import SwiftUI

struct EmojiRatingView: View {
    let rating: Int
    
    var emoji: String {
        if rating <= 4 {
            return "\(rating)"
        } else {
            return "5"
        }
    }
    
    var body: some View {
        Text(emoji)
    }
}

#Preview {
    EmojiRatingView(rating: 3)
}
