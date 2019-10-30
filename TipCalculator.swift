//
//  TipCalculator.swift
//  SwiftUI_TipCalculator
//
//  Created by Bori Oludemi on 10/30/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import SwiftUI

struct TipCalculator: View {
    @State private var totalAmount: String = ""
    private let tipPercentages = [0, 10, 15, 20, 25]
    @State private var tipPercentageIndex = 0
    @State private var subtotal: Double = 0
    
    var body: some View {
        
        VStack {
            HStack{
                Text("Total amount with tip:")
                Spacer()
                
                Text("\(subtotal)")
            }
            .foregroundColor(.green)
            .padding()
            
            TextField("Enter amount here", text: $totalAmount)
                .keyboardType(.decimalPad) .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            
            Picker(selection: $tipPercentageIndex, label: Text("Please select percentage you want to tip.")) {
                ForEach(0 ..< tipPercentages.count) {
                    Text("\(self.tipPercentages[$0])")
                }
            }.pickerStyle(SegmentedPickerStyle())
                .padding()
            
            HStack{
                Button(action: {
                    self.clearCalculator()
                }, label: {
                    Text("Clear")
                    }).padding(40)
                
                Button(action: {
                    self.calculateTip()
                }, label: {
                    Text("Calculate")
                    })
                .padding(40)
            }
        }
    }
    
    func clearCalculator() {
        subtotal = 0.0
        tipPercentageIndex = 0
        totalAmount = ""
    }
    
    func calculateTip() {
        guard let castedAmount = Double(totalAmount) else {
            return
        }
         subtotal = castedAmount + (castedAmount * (Double(tipPercentages[tipPercentageIndex]) / 100))
    }
}

struct TipCalculator_Previews: PreviewProvider {
    static var previews: some View {
        TipCalculator()
    }
}
