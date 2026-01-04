//
//  ContentView.swift
//  UnitConverter
//
//  Created by Zachary Lâm on 2026-01-04.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit: String = "F"
    @State private var outputUnit: String = "C"
    @State private var temperatureInput: Double = 0.0
    
    let units: Array<String> = ["F", "C", "K"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Input") {
                    Picker("", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0)°")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Output") {
                    Picker("", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0)°")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Temperature (\(inputUnit)°)") {
                    TextField("Temperature Input", value: $temperatureInput, format: .number)
                        .keyboardType(.decimalPad)
                }
            }
            .navigationTitle("Unit Converter")
        }
    }
}

#Preview {
    ContentView()
}
