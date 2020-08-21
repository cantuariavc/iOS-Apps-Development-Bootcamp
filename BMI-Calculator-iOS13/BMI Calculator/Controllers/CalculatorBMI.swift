//
//  BMI.swift
//  BMI Calculator
//
//  Created by Vinícius Cantuária on 20/08/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class BMI {
    let value: Float
    let advice: String
    let color: UIColor
    
    init(height: Float, weight: Float) {
        value = weight/pow(height, 2)
        
        if value < 18.5 {
            advice = "Eat more pies!"
            color = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        } else if value < 24.9 {
            advice = "Fit as a fiddle!"
            color = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        } else {
            advice = "Eat less pies!"
            color = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
    }
    
    func getBMIValue() -> String {
        return String(format: "%.2f", value)
    }
}
