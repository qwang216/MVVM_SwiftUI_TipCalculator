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
    @Published var amount: Int = 0
    @Published var tipAmount: Int = 0
    
    func calculateTip() -> Int {
        return 0
    }
}
