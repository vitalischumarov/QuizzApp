//
//  QuestionModel.swift
//  QuizzApp
//
//  Created by Vitali Schumarov on 07.05.23.
//

import Foundation

struct QuestionModel {
    
    var score: Int = 0
    var questionNumber: Int = 0
    var allQuestion = [
        Question(question: "War Adam der erste Mensch, der von Gott erschaffen wurde?", answer: "False"),
        Question(question: "Hat Mose alle fünf Bücher der Bibel geschrieben?", answer: "True"),
        Question(question: "Ist Jesus Christus im Alter von 33 Jahren gestorben?", answer: "True"),
        Question(question: "War Maria Magdalena eine Prostituierte?", answer: "False"),
        Question(question: "Hat Kain Abel mit einem Stein erschlagen?", answer: "True"),
        Question(question: "Wurde Jona von einem Wal verschluckt?", answer: "True"),
        Question(question: "Wurde Jesus am Karfreitag gekreuzigt?", answer: "True"),
        Question(question: "War Salomo der jüngste Sohn Davids?", answer: "False"),
        Question(question: "Hat Johannes der Täufer Jesus getauft?", answer: "True"),
        Question(question: "Hat Petrus Jesus dreimal verleugnet?", answer: "True")
    ]
    
    mutating func nextQuestion() -> Bool {
        if (questionNumber == allQuestion.count - 1) {
            return false
        } else {
            questionNumber += 1
            return true
        }
    }
    
    mutating func addScore() {
        score += 1
    }
    
    mutating func resetGame() {
        score = 0
        questionNumber = 0
    }
    
}
