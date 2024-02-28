//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by sky on 2024/2/19.
//

import SwiftUI


struct FlagImage: View {
    var name: String
    
    var body: some View {
        Image(name)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var correctScore = 0
    
    @State private var playCount = 0
    
    private let limitPlayCount = 8
    
    @State private var tapedFlag: Int?
    
    var body: some View {
        ZStack {
//            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
//                .ignoresSafeArea()
            RadialGradient(stops:[
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .center, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) {number in
                        Button {
                            withAnimation {
                                flagTapped(number)
                            } completion: {
                                tapedFlag = nil
                            }

                        } label: {
                            FlagImage(name: countries[number])
                                .opacity(tapedFlag == nil ? 1.0 : number == tapedFlag ? 1.0 : 0.25)
                                .rotation3DEffect(
                                    .degrees(number == tapedFlag ? 360 : 0),
                                    axis: (x: 0.0, y: 1.0, z: 0.0)
                                )
                                .scaleEffect(tapedFlag == nil ? 1.0 : number == tapedFlag ? 1.0 : 0.8)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                Spacer()
                Spacer()
                Text("Score: \(correctScore)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            let title = playCount > limitPlayCount ? "Reset" : "Coutinue"
            let action = playCount > limitPlayCount ? resetGame : askQuestion
            Button(title, action: action)
        } message: {
            Text("Your score is :\(correctScore)")
        }
    }
    
    func flagTapped(_ number: Int) {
        tapedFlag = number
        playCount += 1
        
        if playCount > limitPlayCount {
            scoreTitle = "You have already played \(limitPlayCount)"
            showingScore = true
            return
        }
        if number == correctAnswer {
            scoreTitle = "Correct"
            correctScore += 1
        } else {
            let flag = countries[number]
            scoreTitle = "Wrong! That’s the flag of \(flag)"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func resetGame() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        correctScore = 0
        playCount = 0
    }
}

#Preview {
    ContentView()
}
