//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    
    let quiz = [
        Question(text: "Four + Two is equal Six", answer: "True"),
        Question(text: "Five + Three is equal One", answer: "True"),
        Question(text: "Three + Eight is less than Ten", answer: "False"),
    ]
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func ansverButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle
        let actualQuestion = quiz[questionNumber].text
        let actualAnswer = quiz[questionNumber].answer
        
        if userAnswer == actualAnswer {
            print("Right!")
        } else {
            print("Wrong!")
        }
        
        if questionNumber + 1 <= quiz.count {
            questionNumber += 1
            updateUI()
        }
     
        
    }
    
    func updateUI() {
        if questionNumber <= quiz.count {
            questionLabel.text = quiz[questionNumber].text
        }
    }
    
}

