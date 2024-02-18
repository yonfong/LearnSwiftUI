//
//  ContentView.swift
//  Conversions
//
//  Created by sky on 2024/2/16.
//

import SwiftUI

struct ContentView: View {
    @State private var inputLength = 0.0
    @State private var inputUnit = LengthUnit.meters
    @State private var outputUnit = LengthUnit.meters
    
    private var outputLength: Double {
        var scale = 1.0
        let conversion: (outputUnit: LengthUnit, inputUnit: LengthUnit) = (outputUnit, inputUnit)
        
        switch conversion {
        case (.meters, .kilometers):
            scale = 1000
        case (.meters, .feet):
            scale = 0.3048
        case (.meters, .yards):
            scale = 0.9144
        case (.meters, .miles):
            scale = 1609.344
        case (.kilometers, .meters):
            scale = 0.001
        case (.kilometers, .feet):
            scale = 0.0003048
        case (.kilometers, .yards):
            scale = 0.0009144
        case (.kilometers, .miles):
            scale = 1.609344
        case (.feet, .meters):
            scale = 3.2808398950131
        case (.feet, .kilometers):
            scale = 3280.8398950131
        case (.feet, .yards):
            scale = 3
        case (.feet, .miles):
            scale = 5280
            
        case (.yards, .meters):
            scale = 1.0936132983377
        case (.yards, .kilometers):
            scale = 1093.6132983377
        case (.yards, .feet):
            scale = 0.33333333333333
        case (.yards, .miles):
            scale = 1760
            
        case (.miles, .meters):
            scale = 0.00062137119223733
        case (.miles, .kilometers):
            scale = 0.62137119223733
        case (.miles, .feet):
            scale = 0.00018939393939394
        case (.miles, .yards):
            scale = 0.00056818181818182
            
        default:
            scale = 1.0
        }
        
        return inputLength * scale
    }
    
    enum LengthUnit: String, CaseIterable, RawRepresentable {
        var id: Self {
            return self
        }
        
        case meters, kilometers, feet, yards, miles
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Input Length") {
                    TextField("Input Length", value: $inputLength, format: .number)
                    Picker("Length Unit", selection: $inputUnit) {
                        ForEach(LengthUnit.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .textCase(nil)
                
                Section("Outpu Length") {
                    Text(outputLength, format: .number)
                    Picker("Length Unit", selection: $outputUnit) {
                        ForEach(LengthUnit.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .textCase(nil)
            }
            .navigationTitle("Length Conversion")
        }
    }
}

#Preview {
    ContentView()
}
