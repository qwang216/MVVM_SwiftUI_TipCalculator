//
//  TipCalculatorViewModel.swift
//  SwiftUI_TipCalculator
//
//  Created by Bori Oludemi on 10/29/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Combine
import SwiftUI

class TipCalculatorViewModel: ObservableObject {
    @Published var amount: String = ""      // bill is $100
    @Published var tipIndex: Int = 0   // bill is $10 => %10
    @Published var subTotal: Double = 0.0
    let tipPercentagesArray = [0, 10, 15, 20, 25]

    func clearCalculator() {
        amount = ""
        tipIndex = 0
    }
    
    func calculateTip() {
        guard let castedAmount = Double(amount) else {
            return
        }
        subTotal = castedAmount + (castedAmount * (Double(tipPercentagesArray[tipIndex]) / 100))
    }
}

//struct Payment {
//    var amount: String
//    var tipIndex: Int
//var subTotal: 
//}
