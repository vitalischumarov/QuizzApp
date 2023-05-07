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
    @IBOutlet weak var restartButton: UIButton!
    
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

            updateProgressBar()
            updateScore()
            changeCorrectButtonColor(buttonName: pressedAnswer)
            updateQuestion()
        } else {
            updateProgressBar()
            changeWrongButtonColor(buttonName: pressedAnswer)
            updateQuestion()
        }
    }
    
    func updateQuestion() {
        if (questionModel.nextQuestion()) {
            questionLabel.text = questionModel.allQuestion[questionModel.questionNumber].question
        } else {
            trueButton.isEnabled = false
            falseButton.isEnabled = false
            questionLabel.text = "Das Spiel ist zu ende."
            restartButton.isEnabled = true
            restartButton.backgroundColor = UIColor.systemBlue

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
            self.trueButton.backgroundColor = UIColor.systemBlue
            self.falseButton.backgroundColor = UIColor.systemBlue
        }
    }
    
    @IBAction func restartGame(_ sender: UIButton) {
        questionModel.resetGame()
        scoreLabel.text = ("Score: \(questionModel.score) / \(questionModel.allQuestion.count)")
        progressBar.progress = 0.0
        questionLabel.text = questionModel.allQuestion[questionModel.questionNumber].question
        print("tapped")
        trueButton.isEnabled = true
        trueButton.backgroundColor = UIColor.systemBlue
        falseButton.isEnabled = true
        falseButton.backgroundColor = UIColor.systemBlue
        restartButton.backgroundColor = UIColor.gray
        restartButton.isEnabled = false
    }
    
}

