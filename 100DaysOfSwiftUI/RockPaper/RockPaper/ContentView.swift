//
//  ContentView.swift
//  RockPaper
//
//  Created by sky on 2024/2/21.
//

import SwiftUI



struct ContentView: View {
    
    enum Guess: String, CaseIterable, RawRepresentable {
        case rock, paper, scissors
        
        var emoji: String {
            switch self {
            case .rock:
                return "👊"
            case .paper:
                return "✋"
            case .scissors:
                return "✌️"
            }
        }
    }
    
    @State private var choice: Guess = Guess.allCases.randomElement()!
    @State private var shouldWin = Bool.random()
    
    @State private var score = 0
    
    @State private var playCount = 0
    
    @State private var finishTurn = false
    
    var body: some View {
        VStack(spacing: 20) {
            Section("the current choice:") {
                Text(choice.emoji)
                    .font(.system(size: 100))
            }
            
            Section("make your choice to sure you should \(shouldWin ? "Win" : "Lose")") {
                HStack {
                    ForEach(Guess.allCases.shuffled(), id: \.self) {sign in
                        Button {
                            judgePlayerScoreBy(playerChoice: sign)
                        } label: {
                            Text(sign.emoji)
                                .font(.system(size: 100))
                        }
                    }
                }
            }
            
            if playCount > 0 {
                Text("Your score: \(score)")
            }
        }
        .alert("You have player \(playCount)", isPresented: $finishTurn) {
            Button("Reset", action: resetGame)
        } message: {
            Text("Your score is :\(score)")
        }
    }
    
    func judgePlayerScoreBy(playerChoice: Guess) {
        playCount += 1
        
        let theChoices:(app: Guess, player: Guess) = (choice, playerChoice)
        
        switch theChoices {
        case (.rock, .paper):
            if shouldWin {
                score += 1
            } else {
                score -= 1
            }
        case (.rock, .scissors):
            if shouldWin {
                score -= 1
            } else {
                score += 1
            }
        case (.paper, .rock):
            if shouldWin {
                score -= 1
            } else {
                score += 1
            }
        case (.paper, .scissors):
            if shouldWin {
                score += 1
            } else {
                score -= 1
            }
        case (.scissors, .rock):
            if shouldWin {
                score += 1
            } else {
                score -= 1
            }
        case (.scissors, .paper):
            if shouldWin {
                score -= 1
            } else {
                score += 1
            }
        default:
            score -= 1
        }
        
        choice = Guess.allCases.randomElement()!
        shouldWin.toggle()
        
        if playCount > 10 {
            finishTurn = true
        }
    }
    
    private func resetGame() {
        score = 0
        playCount = 0
        choice = Guess.allCases.randomElement()!
        shouldWin = Bool.random()
        finishTurn = false
    }
}

#Preview {
    ContentView()
}
