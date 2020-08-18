//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Vinícius Cantuária on 17/08/20.
//  Copyright © 2020 Vinícius Cantuária. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var magicBallView: UIImageView!
    
    let answers = [ #imageLiteral(resourceName: "ball2"), #imageLiteral(resourceName: "ball1"), #imageLiteral(resourceName: "ball3"), #imageLiteral(resourceName: "ball2"), #imageLiteral(resourceName: "ball3") ]
    
    @IBAction func answerButton(_ sender: UIButton) {
        magicBallView.image = answers.randomElement()
    }
}

