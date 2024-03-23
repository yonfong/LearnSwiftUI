//
//  ProspectsView.swift
//  HotProspects
//
//  Created by sky on 2024/3/23.
//

import SwiftUI
import SwiftData

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
    
    @Query(sort: \Prospect.name) var prospects: [Prospect]
    @Environment(\.modelContext) var modelContext
    
    
    let filter: FilterType
    
    var body: some View {
        NavigationStack {
            Text("People: \(prospects.count)")
                .navigationTitle(title)
                .toolbar {
                    Button("Scan", systemImage: "qrcode.viewfinder") {
                        let prospect = Prospect(name: "zhangsan", emailAddress: "zhangsan@qq.com", isContacted: false)
                        
                        modelContext.insert(prospect)
                    }
                }
        }
    }
}

#Preview {
    ProspectsView(filter: .none)
        .modelContainer(for: Prospect.self)
}
