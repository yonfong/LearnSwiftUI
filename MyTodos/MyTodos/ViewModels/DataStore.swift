//
//  DataStore.swift
//  MyTodos
//
//  Created by sky on 2024/3/30.
//

import Foundation
import Combine

class DataStore:ObservableObject {
    @Published var toDos:[ToDo] = []
    @Published var appError: ErrorType? = nil
    
    var subscriptions = Set<AnyCancellable>()
    
    var addToDo = PassthroughSubject<ToDo, Never>()
    var updateToDo = PassthroughSubject<ToDo, Never>()
    var deleteToDo = PassthroughSubject<IndexSet, Never>()
    var loadToDos = Just(FileManager.docDirURL.appendingPathComponent(fileName))
    
    init() {
        print(FileManager.docDirURL.path)
        addSubscriptions()
//        if FileManager().docExist(named: fileName) {
//            loadToDos()
//        }
    }
    
    func addSubscriptions() {
        loadToDos.filter{ FileManager.default.fileExists(atPath: $0.path) }
            .tryMap { url in
                try Data(contentsOf: url)
            }
            .decode(type: [ToDo].self, decoder: JSONDecoder())
            .subscribe(on: DispatchQueue(label: "background queue"))
            .receive(on: DispatchQueue.main)
            .sink {[unowned self] completion in
                switch completion {
                case .finished:
                    print("Loading")
                    toDoSubscription()
                case .failure(let error):
                    if error is ToDoError {
                        appError = ErrorType(error: error as! ToDoError)
                    } else {
                        appError = ErrorType(error: ToDoError.decodingError)
                        toDoSubscription()
                    }
                }
            } receiveValue: {[unowned self] toDos in
                self.toDos = toDos
            }
            .store(in: &subscriptions)

        
        addToDo.sink { [unowned self]toDo in
            toDos.append(toDo)
//            saveToDos()
        }
        .store(in: &subscriptions)
        
        updateToDo.sink {[unowned self] toDo in
            guard let index = toDos.firstIndex(where: {$0.id == toDo.id}) else { return }
            toDos[index] = toDo
//            saveToDos()
        }
        .store(in: &subscriptions)
        
        deleteToDo.sink {[unowned self] indexSet in
            toDos.remove(atOffsets: indexSet)
//            saveToDos()
        }
        .store(in: &subscriptions)
    }
    
    func toDoSubscription() {
        $toDos.subscribe(on: DispatchQueue(label: "background queue"))
            .receive(on: DispatchQueue.main)
            .dropFirst()
            .encode(encoder: JSONEncoder())
            .tryMap { data in
                try data.write(to: FileManager.docDirURL.appendingPathComponent(fileName))
            }
            .sink {[unowned self] completion in
                switch completion {
                case .finished:
                    print("saving completed")
                case .failure(let error):
                    if error is ToDoError {
                        appError = ErrorType(error: error as! ToDoError)
                    } else {
                        appError = ErrorType(error: ToDoError.encodingError)
                    }
                }
            } receiveValue: { _ in
                print("savging file was successful")
            }
            .store(in: &subscriptions)
    }
    
//    func addToDo(_ toDo: ToDo) {
//        toDos.append(toDo)
//        saveToDos()
//    }
//    
//    func updateToDo(_ toDo: ToDo) {
//        guard let index = toDos.firstIndex(where: {$0.id == toDo.id}) else { return }
//        toDos[index] = toDo
//        saveToDos()
//    }
//    
//    func deleteToDo(at indexSet: IndexSet) {
//        toDos.remove(atOffsets: indexSet)
//        saveToDos()
//    }
    
//    func loadToDos() {
//        FileManager().readDocument(docName: fileName) { result in
//            switch result {
//            case .success(let data):
//                let decoder = JSONDecoder()
//                do {
//                    toDos = try decoder.decode([ToDo].self, from: data)
//                } catch {
//                    appError = ErrorType(error: .decodingError)
////                    print(ToDoError.decodingError.localizedDescription)
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//                appError = ErrorType(error: error)
//            }
//        }
//    }
    
//    func saveToDos() {
//        print("saving todos to file system eventually")
//        let encoder = JSONEncoder()
//        do {
//            let data = try encoder.encode(toDos)
//            let jsonString = String(decoding: data, as: UTF8.self)
//            
//            FileManager().saveDocument(contents: jsonString, docName: fileName) { error in
//                if let error = error {
//                    print(error.localizedDescription)
//                    appError = ErrorType(error: error)
//                }
//            }
//        } catch {
//            appError = ErrorType(error: .encodingError)
//            print(ToDoError.encodingError.localizedDescription)
//        }
//    }
}
