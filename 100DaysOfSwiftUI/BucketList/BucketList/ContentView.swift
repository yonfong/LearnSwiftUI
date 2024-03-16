//
//  ContentView.swift
//  BucketList
//
//  Created by sky on 2024/3/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Read and write") {
            let data = Data("test message".utf8)
            let url = URL.documentsDirectory.appending(path: "message.txt")
            
            do {
                try data.write(to: url, options: [.atomic, .completeFileProtection])
                let input = try String(contentsOf: url)
                print(input)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    ContentView()
}
