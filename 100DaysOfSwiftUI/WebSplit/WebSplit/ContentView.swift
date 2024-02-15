//
//  ContentView.swift
//  WebSplit
//
//  Created by sky on 2024/2/8.
//

import SwiftUI

struct ContentView: View {
//    @State private var name = ""
    
    let students = ["zhangsan", "lisi", "wangwu"]
    @State private var selectedStudent = "zhangsan"
    
    var body: some View {
        Text("Hello, world")
//        Form {
//            TextField("Enter your name", text: $name)
//            Text("Your name is \(name)")
//        }
//        Form {
//            ForEach(0..<100) {
//                Text("Row \($0)")
//            }
//        }
        
//        NavigationStack {
//            Form {
//                Picker("Select your student", selection: $selectedStudent) {
//                    ForEach(students, id: \.self) {
//                        Text($0)
//                    }
//                }
//            }
//        }
    }
}

#Preview {
    ContentView()
}
