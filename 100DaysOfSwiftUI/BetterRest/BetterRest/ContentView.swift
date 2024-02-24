//
//  ContentView.swift
//  BetterRest
//
//  Created by sky on 2024/2/21.
//

import CoreML
import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepCount = 8.0
    @State private var coffeeAmount = 0
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime:Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        
        return Calendar.current.date(from: components) ?? .now
    }
    
    var bedTimeTip: String {
        var tip = ""
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Int64(hour + minute), estimatedSleep: sleepCount, coffee: Int64(coffeeAmount + 1))
            
            let sleepTime = wakeUp - prediction.actualSleep
            tip = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            tip = "Sorry, there was a problem calculating your bedtime."
        }
        
        return tip
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
                } header: {
                    Text("When do you want to wake up?")
                        .font(.headline)
                        .labelsHidden()
                }
                .textCase(nil)
                
                Section {
                    Stepper("\(sleepCount.formatted()) hours", value: $sleepCount, in: 4...12, step: 0.25)
                        .frame(height: 40)
                } header: {
                    Text("Desired amount of sleep")
                        .font(.headline)
                }
                .textCase(nil)
                
                Section {
                    Picker("Daily coffee intake", selection: $coffeeAmount) {
                        ForEach(1..<21) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.automatic)
                }
                
                Section("Your ideal bedtime is") {
                    Text(bedTimeTip)
                        .foregroundStyle(.red)
                        .font(.largeTitle)
                }
                .textCase(nil)
            }
//            .alert(alertTitle, isPresented: $showingAlert) {
//                Button("OK"){}
//            } message: {
//                Text(alertMessage)
//            }
            .navigationTitle("BetterRest")
//            .toolbar {
//                Button("Calculate", action: calculateBedTime)
//            }
        }
    }
    
    func calculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Int64(hour + minute), estimatedSleep: sleepCount, coffee: Int64(coffeeAmount + 1))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your ideal bedtime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        showingAlert = true
    }
}

#Preview {
    ContentView()
}
