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
    
    var temperatureOutput: Double {
        if inputUnit == "F" {
            if outputUnit == "C" {
                return (temperatureInput - 32) * 5 / 9
            } else if outputUnit == "K" {
                return (temperatureInput - 32) * 5 / 9 + 273.15
            } else {
                return temperatureInput
            }
        } else if inputUnit == "C" {
            if outputUnit == "F" {
                return (temperatureInput * 9 / 5) + 32
            } else if outputUnit == "K" {
                return temperatureInput + 273.15
            } else {
                return temperatureInput
            }
        } else if inputUnit == "K" {
            if outputUnit == "F" {
                return (temperatureInput - 273.15) * 9 / 5 + 32
            } else if outputUnit == "C" {
                return temperatureInput - 273.15
            } else {
                return temperatureInput
            }
        } else {
            return temperatureInput
        }
    }
    
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
                
                Section("Temperature (\(outputUnit)°)") {
                    Text(temperatureOutput, format: .number.precision(.fractionLength(1)))
                }
            }
            .navigationTitle("Unit Converter")
        }
    }
}

#Preview {
    ContentView()
}
