//
//  ContentView.swift
//  WordScramble
//
//  Created by sky on 2024/2/24.
//

import SwiftUI

struct ContentView: View {
    let people = ["Finn", "Leia", "Luke", "Rey", "Leia"]
    
    var body: some View {
        List(0..<5) {
            Text("Dynamic row \($0)")
        }
        
        List(people, id: \.self) {
            Text($0)
        }
    }
    
    func textChecker() {
        let word = "swift"
        
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        let passed = misspelledRange.location == NSNotFound
    }
}

#Preview {
    ContentView()
}
