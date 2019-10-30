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
    @Published var amount: Double = 0      // bill is $100
    @Published var tipAmount: Double = 0   // bill is $10 => %10
    @Published var subTotal: Double = 0 // total is $110
    @State var tipPercent: Double = 0

    func clearCalculator() {
        amount = 0
        tipAmount = 0
    }
    
    func calculateTip() {
        subTotal = amount + (amount * (tipPercent / 100))
    }
}
