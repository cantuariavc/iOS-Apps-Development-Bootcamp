//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userScore: UILabel!
    @IBOutlet weak var quastionLabel: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quiz = Quiz()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        if quiz.checkAnswer(userAnswer) {
            userScore.text = "Score: \(quiz.answersRight)"
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quiz.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        quastionLabel.text = quiz.getQuestionText()
        firstButton.setTitle(quiz.getQuestionOptions()[0], for: .normal)
        secondButton.setTitle(quiz.getQuestionOptions()[1], for: .normal)
        thirdButton.setTitle(quiz.getQuestionOptions()[2], for: .normal)
        
        progressBar.progress = quiz.getProgress()
        firstButton.backgroundColor = UIColor.clear
        secondButton.backgroundColor = UIColor.clear
        thirdButton.backgroundColor = UIColor.clear
    }
    
}

