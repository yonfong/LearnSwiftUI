//
//  ContentView.swift
//  HotProspects
//
//  Created by sky on 2024/3/22.
//

import SwiftUI

struct ContentView: View {
    let users = ["zhangsna", "lisi", "wangwu", "zhaoliu"]
    
//    @State private var selection: String?
    
    @State private var selection = Set<String>()
    
    var body: some View {
        List(users, id: \.self, selection: $selection) { user in
            Text(user)
        }
        
        if  !selection.isEmpty {
            Text("You slected \(selection.formatted())")
        }
        EditButton()
    }
}

#Preview {
    ContentView()
}
