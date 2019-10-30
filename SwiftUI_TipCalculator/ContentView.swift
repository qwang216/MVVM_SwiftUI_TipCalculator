//
//  ContentView.swift
//  SwiftUI_TipCalculator
//
//  Created by Jason wang on 10/29/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var tipPercentage = 0
    @State private var totalAmount: String = ""
    let tipPercentagesArray = [0, 10, 15, 20, 25]
    
    // Initialize MVVM object here like so
    @ObservedObject var tipCalculatorViewModel = TipCalculatorViewModel()
    
    var body: some View {
        
        VStack {
            HStack{
                Text("Total amount entered:")
                Spacer()
                Text("100") // Replace with $paymentObject.amount
            }.padding()
            
            HStack{
                Text("Tip percentage selected:")
                Spacer()
                Text("\(tipPercentagesArray[tipPercentage])")
            }
            .foregroundColor(.red)
            .padding()
            
            HStack{
                Text("Total amount with tip:")
                Spacer()
                
                Text("\(tipCalculatorViewModel.subTotal)")
            }
            .foregroundColor(.green)
            .padding()
            
            TextField("Enter amount here", text: $totalAmount)
                .keyboardType(.decimalPad) .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            
            Picker(selection: tipCalculatorViewModel.$tipPercent, label: Text("Please select percentage you want to tip.")) {
                ForEach(0 ..< tipPercentagesArray.count) {
                    Text("\(self.tipPercentagesArray[$0])")
                }
            }.pickerStyle(SegmentedPickerStyle())
                .padding()
            
            Button(action: {
                self.tipCalculatorViewModel.clearCalculator()
            }, label: {
                Text("Clear")
                })
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
