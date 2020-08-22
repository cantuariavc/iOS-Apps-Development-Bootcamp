//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var billTotalLabel: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var bill = Bill()
    
    @IBAction func billTotalEdited(_ sender: UITextField) {
        bill.billTotal = billTotalLabel.text!
    }
    
    @IBAction func pctButtonPressed(_ sender: UIButton) {
        billTotalLabel.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        bill.tip = Int(sender.currentTitle!.dropLast())!
        
    }
    
    @IBAction func stepperNumberPressed(_ sender: UIStepper) {
        billTotalLabel.endEditing(true)
        
        bill.numberPersons = Int(sender.value)
        splitNumberLabel.text = String(bill.numberPersons)
    }
    
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        bill.calculateResult()
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultVC = segue.destination as! ResultViewController
        
        resultVC.bill = bill
    }
}
