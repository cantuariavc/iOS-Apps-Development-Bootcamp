//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var heightLabelValue: UILabel!
    @IBOutlet weak var heightSlider: UISlider!

    @IBOutlet weak var weightLabelValue: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        
        heightLabelValue.text = "\(String(format: "%.2f", sender.value)) m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightLabelValue.text = "\(String(format: "%.1f", sender.value)) kg"
    }
    
    @IBAction func calculateMBI(_ sender: UIButton) {
        print(weightSlider.value/pow(heightSlider.value, 2))
    
    }
    
}

