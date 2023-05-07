//
//  ViewController.swift
//  QuizzApp
//
//  Created by Vitali Schumarov on 07.05.23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var questionModel = QuestionModel()
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questionModel.allQuestion[questionModel.questionNumber].question
        progressBar.progress = 0.0
        scoreLabel.text = ("Score: \(questionModel.score) / \(questionModel.allQuestion.count)")
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        let pressedAnswer = sender.currentTitle!
        if (pressedAnswer == questionModel.allQuestion[questionModel.questionNumber].answer) {
            updateQuestion()
            updateProgressBar()
            updateScore()
            changeCorrectButtonColor(buttonName: pressedAnswer)
        } else {
            updateQuestion()
            updateProgressBar()
            changeWrongButtonColor(buttonName: pressedAnswer)
        }
    }
    
    func updateQuestion() {
        if ( questionModel.nextQuestion()) {
            questionLabel.text = questionModel.allQuestion[questionModel.questionNumber].question
        } else {
            trueButton.isEnabled = false
            falseButton.isEnabled = false
            questionLabel.text = "Das Spiel ist zu ende."
        }
    }
    
    func updateProgressBar() {
        progressBar.progress = Float(questionModel.questionNumber) / Float(questionModel.allQuestion.count - 1)
    }
    
    func updateScore() {
        questionModel.addScore()
        scoreLabel.text = ("Score: \(questionModel.score) / \(questionModel.allQuestion.count)")
    }
    
    func changeCorrectButtonColor(buttonName: String) {
        if (buttonName == "True") {
            trueButton.backgroundColor = UIColor.green
        } else {
            falseButton.backgroundColor = UIColor.green
        }
        startTimer()
    }
    
    func changeWrongButtonColor(buttonName: String) {
        if (buttonName == "True") {
            trueButton.backgroundColor = UIColor.red
        } else {
            falseButton.backgroundColor = UIColor.red
        }
        startTimer()
    }
    
    func startTimer() {
        let timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { timer in
            self.trueButton.backgroundColor = UIColor.clear
            self.falseButton.backgroundColor = UIColor.clear
        }
    }
}

