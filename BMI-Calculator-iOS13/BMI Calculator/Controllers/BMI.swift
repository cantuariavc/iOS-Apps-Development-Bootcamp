//
//  BMI.swift
//  BMI Calculator
//
//  Created by Vinícius Cantuária on 20/08/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import Foundation

class calculatorBMI {
    func calculateBMI(height: Float, weight: Float) -> Float {
        return weight/pow(height, 2)
    }
}
