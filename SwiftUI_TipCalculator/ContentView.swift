//
//  ContentView.swift
//  SwiftUI_TipCalculator
//
//  Created by Jason wang on 10/29/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var tipCalculatorViewModel = TipCalculatorViewModel()
    
    var body: some View {
        
        VStack {
            HStack{
                Text("Total amount with tip:")
                Spacer()
                
                Text("\(tipCalculatorViewModel.subTotal)")
            }
            .foregroundColor(.green)
            .padding()
            
            TextField("Enter amount here", text: $tipCalculatorViewModel.amount)
                .keyboardType(.decimalPad) .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            
            Picker(selection: $tipCalculatorViewModel.tipIndex, label: Text("Please select percentage you want to tip.")) {
                ForEach(0 ..< tipCalculatorViewModel.tipPercentagesArray.count) {
                    Text("\(self.tipCalculatorViewModel.tipPercentagesArray[$0])")
                }
            }.pickerStyle(SegmentedPickerStyle())
                .padding()
            
            Button(action: {
                self.tipCalculatorViewModel.clearCalculator()
            }, label: {
                Text("Clear")
                })
            
            Button(action: {
                self.tipCalculatorViewModel.calculateTip()
            }, label: {
                Text("Calculate")
                })
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
