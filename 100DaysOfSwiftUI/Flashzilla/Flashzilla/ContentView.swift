//
//  ContentView.swift
//  Flashzilla
//
//  Created by sky on 2024/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var cards = [Card]()
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    @Environment(\.scenePhase) var scenePhase
    @Environment(\.accessibilityVoiceOverEnabled) var accessibilityVoiceOverEnabled
    
    @State private var showingEditScreen = false
    
    @State private var isActive = true
    @State private var timeRemaining = 100
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Image(decorative: "background")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Text("Timer: \(timeRemaining)")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                
                ZStack {
//                    ForEach(0..<cards.count, id: \.self) { index in
//                        CardView(card: cards[index]) {isWrong in 
//                            withAnimation {
//                                removeCard(ad: index)
//                            }
//                        }
//                        .stacked(at: index, in: cards.count)
//                        .allowsHitTesting(index == cards.count - 1)
//                        .accessibilityHidden(index < cards.count - 1)
//                    }
                    
                    ForEach(cards) { card in
                        let index = cards.firstIndex(where: {$0.id == card.id}) ?? 0
                        CardView(card: card) { isWrong in
                            withAnimation {
                                if isWrong {
                                    if let removedCard = removeCard(at: index) {
                                        addCardBack(card: removedCard)
                                    }
                                } else {
                                    _ = removeCard(at: index)
                                }
                            }
                        }
                        .stacked(at: index, in: cards.count)
                        .allowsHitTesting(card == cards.last)
                        .accessibilityHidden(card != cards.last)
                    }
                }
                .allowsHitTesting(timeRemaining > 0)
                
                if cards.isEmpty {
                    Button("Start again", action: resetCards)
                        .padding()
                        .background(.white)
                        .foregroundStyle(.black)
                        .clipShape(.capsule)
                }
            }
            
            VStack {
                HStack {
                    Spacer()
                    Button {
                        showingEditScreen = true
                    } label: {
                        Image(systemName: "plus.circle")
                            .padding()
                            .background(.black.opacity(0.7))
                            .clipShape(.circle)
                    }
                }
                Spacer()
            }
            .foregroundStyle(.white)
            .font(.largeTitle)
            .padding()
            
            if accessibilityDifferentiateWithoutColor || accessibilityVoiceOverEnabled {
                VStack {
                    Spacer()
                    
                    HStack {
                        Button {
                            withAnimation {
                                if let card = removeCard(at: cards.count - 1) {
                                    addCardBack(card: card)
                                }
                            }
                        } label: {
                            Image(systemName: "xmark.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(.circle)
                        }
                        .accessibilityLabel("Wrong")
                        .accessibilityHint("Mark your answer as being incorrect.")
                        
                        Spacer()
                        
                        Button {
                            withAnimation {
                                _ = removeCard(at: cards.count - 1)
                            }
                        } label: {
                            Image(systemName: "checkmark.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(.circle)
                        }
                        .accessibilityLabel("Correct")
                        .accessibilityHint("Mark your answer as being correct.")
                        
                    }
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .padding()
                }
            }
        }
        .onReceive(timer) { time in
            guard isActive else { return }
            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
        .onChange(of: scenePhase) {
            if scenePhase == .active {
                if !cards.isEmpty {
                    isActive = true
                }
            } else {
                isActive = false
            }
        }
        .onAppear(perform: resetCards)
        .sheet(isPresented: $showingEditScreen, onDismiss: resetCards, content: {
            EditCards()
        })
    }
    
    func resetCards() {
        timeRemaining = 100
        isActive = true
        
        loadData()
    }
    
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "cards") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                cards = decoded
            }
        }
    }
    
    func addCardBack(card: Card) {
        let card = Card(id: UUID(), prompt: card.prompt, answer: card.answer)
        cards.insert(card, at: 0)
        isActive = true
    }
    
    func removeCard(at index: Int) -> Card? {
        guard index >= 0 else { return nil }
        let card = cards.remove(at: index)
        if cards.isEmpty {
            isActive = false
        }
        return card
    }
    
    func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
        if UIAccessibility.isReduceMotionEnabled {
            return try body()
        } else {
            return try withAnimation(animation, body)
        }
    }
    
}

#Preview {
    ContentView()
}

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(y: offset * 10)
    }
}
