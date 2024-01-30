//
//  ContentView.swift
//  FirstProject
//
//  Created by Sandeep Kulkarni on 30/01/24.
//

import SwiftUI

enum CalculatorMode {
    case notSet
    case addition
    case substraction
    case multiplication
}

struct ContentView: View {
    @State var currentValue = "0"
    @State var currentMode : CalculatorMode = .notSet
    @State var lastButtonWasMode = false
    @State var savedNum = 0
    @State var currentValueInt = 0
    var body: some View {
        ZStack {
            Color(.black)
            VStack(alignment: .center) {
                TotalText(value: currentValue)
                HStack {
                    CalculatorButton(buttonText: "1", action: didPressNumber)
                    CalculatorButton(buttonText: "2", action: didPressNumber)
                    CalculatorButton(buttonText: "3", action: didPressNumber)
                    CalculatorButton(buttonText: "+", color: .orange, action: didPressMode, mode: .addition)
                }
                HStack {
                    CalculatorButton(buttonText: "4", action: didPressNumber)
                    CalculatorButton(buttonText: "5", action: didPressNumber)
                    CalculatorButton(buttonText: "6", action: didPressNumber)
                    CalculatorButton(buttonText: "-", color: .orange, action: didPressMode, mode: .substraction)
                }
                HStack {
                    CalculatorButton(buttonText: "7", action: didPressNumber)
                    CalculatorButton(buttonText: "8", action: didPressNumber)
                    CalculatorButton(buttonText: "9", action: didPressNumber)
                    CalculatorButton(buttonText: "x", color: .orange, action: didPressMode, mode: .multiplication)
                }
                HStack {
                    CalculatorButton(buttonText: "0", width: 148, action: didPressNumber)
                    CalculatorButton(buttonText: "C", color: .gray, action: didPressClear)
                    CalculatorButton(buttonText: "=", color: .orange, action: didPressEquals)
                }
            }
        }
        .ignoresSafeArea()
    }
    
    func didPressNumber(button : CalculatorButton) {
        if lastButtonWasMode {
            lastButtonWasMode = false
            currentValueInt = 0
        }
        if let parsedValue = Int("\(currentValueInt)" + button.buttonText){
            currentValueInt = parsedValue
            updateText()
        } else {
            currentValue = "Error"
            currentValueInt = 0
        }
        
    }
    
    func didPressMode(button : CalculatorButton) {
        currentMode = button.mode
        lastButtonWasMode = true
    }
    
    func didPressClear(button : CalculatorButton) {
        currentValue = "0"
        currentMode = .notSet
        lastButtonWasMode = false
        savedNum = 0
        currentValueInt = 0
    }
    
    func didPressEquals(button : CalculatorButton) {
        if currentMode == .notSet || lastButtonWasMode {
            return
        }
        
        if currentMode == .addition {
            savedNum += currentValueInt
        } else if currentMode == .substraction {
            savedNum -= currentValueInt
        } else if currentMode == .multiplication {
            savedNum *= currentValueInt
        }
        currentValueInt = savedNum
        updateText()
        lastButtonWasMode = true
    }
    
    func updateText() {
        if currentMode == .notSet {
            savedNum = currentValueInt
        }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let num = NSNumber(value: currentValueInt)
        currentValue = numberFormatter.string(from: num) ?? "Error"
        
    }
}

#Preview {
    ContentView()
}
