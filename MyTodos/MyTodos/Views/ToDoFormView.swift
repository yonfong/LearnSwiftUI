//
//  ToDoFormView.swift
//  MyTodos
//
//  Created by sky on 2024/3/30.
//

import SwiftUI

struct ToDoFormView: View {
    @EnvironmentObject var dataStore: DataStore
    @Environment(\.presentationMode) var presentMode
    @ObservedObject var formVM: ToDoFormViewModel
    
    var body: some View {
        NavigationStack {
            Form {
                VStack(alignment: .leading) {
                    TextField("ToDo", text: $formVM.name)
                    Toggle("Completed", isOn: $formVM.completed)
                }
            }
            .navigationTitle("ToDo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    cancleButton
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    updateSaveButton
                }
            }
        }
    }
}

extension ToDoFormView {
    func updateToDo() {
        let toDo = ToDo(id: formVM.id!, name: formVM.name, completed: formVM.completed)
        dataStore.updateToDo.send(toDo)
        presentMode.wrappedValue.dismiss()
    }
    
    func addToDo() {
        let toDo = ToDo(name: formVM.name)
        dataStore.addToDo.send(toDo)
        presentMode.wrappedValue.dismiss()
    }
    
    var cancleButton: some View {
        Button("Cancle") {
            presentMode.wrappedValue.dismiss()
        }
    }
    
    var updateSaveButton: some View {
        Button(formVM.updating ? "Upate" : "Save", action: formVM.updating ? updateToDo : addToDo)
            .disabled(formVM.isDisabled)
    }
}

#Preview {
    NavigationStack {
        ToDoFormView(formVM: ToDoFormViewModel())
            .environmentObject(DataStore())
    }
}
