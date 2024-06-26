//
//  ContentView.swift
//  MyTodos
//
//  Created by sky on 2024/3/30.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataStore: DataStore
    @State private var modelType: ModeType? = nil
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(dataStore.toDos.value) { toDo in
                    Button {
                        modelType = .update(toDo)
                    } label: {
                        Text(toDo.name)
                            .font(.title3)
                            .strikethrough(toDo.completed)
                            .foregroundColor(toDo.completed ? .green : Color(.label))
                    }
                }
                .onDelete(perform: dataStore.deleteToDo.send)
            }
            .listStyle(.insetGrouped)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("My todos")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        modelType = .new
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
            .sheet(item: $modelType) { modelType in
                modelType
            }
            .alert(item: $dataStore.appError.value) { appError in
                Alert(title: Text("Oh Oh"), message: Text(appError.error.localizedDescription))
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(DataStore())
}
