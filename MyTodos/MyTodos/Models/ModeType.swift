//
//  ModeType.swift
//  MyTodos
//
//  Created by sky on 2024/3/30.
//

import SwiftUI

enum ModeType: Identifiable, View {
    case new
    case update(ToDo)
    var id: String {
        switch self {
        case .new:
            return "new"
        case .update(_):
            return "update"
        }
    }
    
    var body: some View {
        switch self {
        case .new:
            return ToDoFormView(formVM: ToDoFormViewModel())
        case .update(let toDo):
            return ToDoFormView(formVM: ToDoFormViewModel(toDo))
        }
    }
}
