//
//  EditCards.swift
//  Flashzilla
//
//  Created by sky on 2024/3/25.
//

import SwiftUI

struct EditCards: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var cards = [Card]()
    @State private var newPromot = ""
    @State private var newAnswer = ""
    
    var body: some View {
        NavigationStack {
            List {
                Section("Add new card") {
                    TextField("Promot", text: $newPromot)
                    TextField("Answer", text: $newAnswer)
                    Button("Add card", action: addCard)
                }
                
                Section {
                    ForEach(0..<cards.count, id: \.self) { index in
                        VStack(alignment: .leading, content: {
                            Text(cards[index].prompt)
                                .font(.headline)
                            Text(cards[index].answer)
                                .foregroundStyle(.secondary)
                        })
                    }
                    .onDelete(perform: removeCards)
                }
            }
            .navigationTitle("Edit cards")
            .toolbar {
                Button("Done", action: done)
            }
            .onAppear(perform: loadData)
        }
    }
    
    func done() {
        dismiss()
    }
    
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "cards") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                cards = decoded
            }
        }
    }
    
    func saveData() {
        if let data = try? JSONEncoder().encode(cards) {
            UserDefaults.standard.setValue(data, forKey: "cards")
        }
    }
    
    func addCard() {
        let trimmedPrompt = newPromot.trimmingCharacters(in: .whitespaces)
        let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
        
        guard trimmedPrompt.isEmpty == false && trimmedAnswer.isEmpty == false else { return }
        
        let card = Card(prompt: trimmedPrompt, answer: trimmedAnswer)
        cards.insert(card, at: 0)
        
        saveData()
    }
    
    func removeCards(at offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
        saveData()
    }
}

#Preview {
    EditCards()
}
