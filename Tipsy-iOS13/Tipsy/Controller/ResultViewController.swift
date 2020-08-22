//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Vinícius Cantuária on 21/08/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    var bill: Bill?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = bill!.result
        settingLabel.text = "Split between \(bill!.numberPersons) people, with \(bill!.tip)% tip."
    }
    
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
