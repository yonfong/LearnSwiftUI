//
//  DetailView.swift
//  Navigation
//
//  Created by sky on 2024/3/6.
//

import SwiftUI

struct DetailView: View {
    var number: Int
    
    var body: some View {
        Text("Detail view \(number)")
    }
    
    init(number: Int) {
        self.number = number
        print("create detail view \(number)")
    }
}

#Preview {
    DetailView(number: 0)
}
