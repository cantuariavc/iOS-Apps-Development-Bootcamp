//
//  Bill.swift
//  Tipsy
//
//  Created by Vinícius Cantuária on 22/08/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

class Bill {
    var billTotal = "0.00"
    var tip = 10
    var numberPersons = 2
    var result = "0.00"
    
    
    func calculateResult() {
        result = String(format: "%.2f", Double(billTotal)! * (Double(tip) / 100 + 1) / Double(numberPersons))
    }
}

