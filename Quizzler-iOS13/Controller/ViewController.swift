//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    @IBAction func ansverButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle
        _ = quizBrain.getActualQuestion()
        let result = quizBrain.checkAnswer(userAnswer)
        print(result)
        if result {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.getNextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        progressBar.progress = quizBrain.getProgress()
        firstButton.backgroundColor = UIColor.clear
        secondButton.backgroundColor = UIColor.clear
        thirdButton.backgroundColor = UIColor.clear
        
        questionLabel.text = quizBrain.getQuestionText()
        firstButton.setTitle(quizBrain.getQuestionAnswer(index: 0), for: .normal)
        secondButton.setTitle(quizBrain.getQuestionAnswer(index: 1), for: .normal)
        thirdButton.setTitle(quizBrain.getQuestionAnswer(index: 2), for: .normal)
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }
}

