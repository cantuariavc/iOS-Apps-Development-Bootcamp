//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Vinícius Cantuária on 20/08/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var bmi: BMI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = bmi!.color
        adviceLabel.text = bmi!.advice
        resultLabel.text = bmi!.getBMIValue()
    }
    
    @IBAction func returnToCalculate(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
