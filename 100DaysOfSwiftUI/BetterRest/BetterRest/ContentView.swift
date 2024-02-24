//
//  ContentView.swift
//  BetterRest
//
//  Created by sky on 2024/2/21.
//

import CoreML
import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = Date.now
    @State private var sleepCount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("When do you want to wake up?")
                    .font(.headline)
                DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                Text("Desired amount of sleep")
                    .font(.headline)
                Stepper("\(sleepCount.formatted()) hours", value: $sleepCount, in: 4...12, step: 0.25)
                Text("Daily coffee intake")
                Stepper("\(coffeeAmount) cup(s)", value: $coffeeAmount, in: 1...20)
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK"){}
            } message: {
                Text(alertMessage)
            }
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate", action: calculateBedTime)
            }
        }
    }
    
    func calculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Int64(hour + minute), estimatedSleep: sleepCount, coffee: Int64(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your ideal bedtime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        showingAlert = true
    }
    
    func exampleDates() {
        let tomorrow = Date.now.addingTimeInterval(86400)
        let range = Date.now...tomorrow
        
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        let date = Calendar.current.date(from: components) ?? .now
        
        components = Calendar.current.dateComponents([.hour, .minute], from: date)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        
        
    }
}

#Preview {
    ContentView()
}
