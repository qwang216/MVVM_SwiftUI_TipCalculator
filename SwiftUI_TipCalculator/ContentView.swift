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
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {

        VStack {
            HStack{
                Text("Total amount entered:")
                Spacer()
                Text("100")
            }.padding()
            
            HStack{
                Text("Tip percentage selected:")
                Spacer()
                Text("0")
            }
            .foregroundColor(.red)
            .padding()
            
            HStack{
                Text("Total amount with tip:")
                Spacer()
                
                Text("100")
            }
            .foregroundColor(.green)
            .padding()

            TextField("Enter amount here", text: $totalAmount)
                .keyboardType(.decimalPad) .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            
            Picker(selection: $tipPercentage, label: Text("Please select percentage you want to tip.")) {
                ForEach(tipPercentages, id: \.self) { eachTipPercentage in
                    Text(String(eachTipPercentage))
                }
//                Text("0%").tag(0)
//                Text("10%").tag(1)
//                Text("15%").tag(2)
//                Text("18%").tag(3)
//                Text("20%").tag(4)
            }.pickerStyle(SegmentedPickerStyle())
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
