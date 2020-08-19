//
//  Quastion.swift
//  Quizzler-iOS13
//
//  Created by Vinícius Cantuária on 19/08/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let options: [String]
    let answer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        options = a
        answer = correctAnswer
    }
}
