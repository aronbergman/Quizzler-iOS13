//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Aron I. Bergman on 15.09.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let correct: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answer = a
        correct = correctAnswer
    }
}
