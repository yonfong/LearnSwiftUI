//
//  ProspectsView.swift
//  HotProspects
//
//  Created by sky on 2024/3/23.
//

import SwiftUI

struct ProspectsView: View {
    
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    var title: String {
        switch filter {
        case .none:
            "Everyone"
        case .contacted:
            "Contacted people"
        case .uncontacted:
            "Uncontacted people"
        }
    }
    
    let filter: FilterType
    
    var body: some View {
        NavigationStack {
            Text("Hello, World!")
                .navigationTitle(title)
        }
    }
}

#Preview {
    ProspectsView(filter: .none)
}
