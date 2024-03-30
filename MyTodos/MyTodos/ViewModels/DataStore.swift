//
//  DataStore.swift
//  MyTodos
//
//  Created by sky on 2024/3/30.
//

import Foundation

class DataStore:ObservableObject {
    @Published var toDos:[ToDo] = []
    
    init() {
        loadToDos()
    }
    
    func addToDo(_ toDo: ToDo) {
        toDos.append(toDo)
    }
    
    func updateToDo(_ toDo: ToDo) {
        guard let index = toDos.firstIndex(where: {$0.id == toDo.id}) else { return }
        toDos[index] = toDo
    }
    
    func deleteToDo(at indexSet: IndexSet) {
        toDos.remove(atOffsets: indexSet)
    }
    
    func loadToDos() {
        toDos = ToDo.sampleData
    }
    
    func saveToDos() {
        print("saving todos to file system eventually")
    }
}
