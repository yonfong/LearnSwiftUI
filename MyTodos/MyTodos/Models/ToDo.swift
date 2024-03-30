//
//  ToDo.swift
//  MyTodos
//
//  Created by sky on 2024/3/30.
//

import Foundation

struct ToDo: Identifiable, Codable {
    var id = UUID().uuidString
    var name: String
    var completed = false
    
    static var sampleData:[ToDo] {
        [
            ToDo(name: "gex"),
            ToDo(name: "xljfesl", completed: true)
        ]
    }
}
