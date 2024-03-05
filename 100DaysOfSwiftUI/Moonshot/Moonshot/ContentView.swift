//
//  ContentView.swift
//  Moonshot
//
//  Created by sky on 2024/3/2.
//

import SwiftUI

struct CustomText: View {
    let text: String
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

let layout = [GridItem(.adaptive(minimum: 80)),
              GridItem(.adaptive(minimum: 80)),
              GridItem(.adaptive(minimum: 80))]
struct ContentView: View {
    let astronauts = Bundle.main.decode("astronauts.json")
    
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(0..<100) {
                    Text("Items \($0)")
                }
            }
        }
        
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach(0..<100) {
                    Text("Items \($0)")
                }
            }
        }
        
        
        
//        NavigationStack {
//            NavigationLink {
//                Text("Detail View")
//            } label: {
//                VStack {
//                    Text("This is the label")
//                    Text("so is this")
//                    Image(systemName: "face.smiling")
//                }
//                .font(.largeTitle)
//            }
//            NavigationLink("Tap me") {
//                Text("Detail view")
//            }
//            .navigationTitle("Swift UI")
//        }
        
//        NavigationStack {
//            List(0..<100) { row in
//                NavigationLink("Row \(row)") {
//                    Text("Detail \(row)")
//                }
//            }
//            .navigationTitle("Swift UI")
//        }
        
        
//        Button("Decode JSON") {
//            let input = """
//            {
//                "name": "Taylor Swift",
//                "address": {
//                    "street": "555, Taylor Swift Avenue",
//                    "city": "Nashville"
//                }
//            }
//            """
//
//            let data = Data(input.utf8)
//            let decoder = JSONDecoder()
//            if let user = try? decoder.decode(User.self, from: data) {
//                print(user.address.street)
//            }
//            // more code to come
//        }
        
//        ScrollView(.horizontal) {
//            LazyHStack(spacing: 10) {
//                ForEach(0..<100) {
//                    CustomText("item \($0)")
//                        .font(.title)
//                }
//            }
////            .frame(maxWidth: .infinity)
//        }
    }
}

#Preview {
    ContentView()
}
