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

    var bmi: BMI?
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightLabelValue.text = "\(String(format: "%.2f", sender.value)) m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightLabelValue.text = "\(String(format: "%.1f", sender.value)) kg"
    }
    
    @IBAction func calculateBMI(_ sender: UIButton) {
        bmi = BMI(height: heightSlider.value, weight: weightSlider.value)
        performSegue(withIdentifier: "goToResult", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultVC = segue.destination as! ResultViewController
        resultVC.bmi = bmi!
    }
    
}

