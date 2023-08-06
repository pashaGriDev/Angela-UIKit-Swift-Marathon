//
//  ChooseButton.swift
//  Quizzler-Angela-update
//
//  Created by Павел Грицков on 28.01.23.
//

import Foundation

struct QuizBrain {
    
    var qustionNumber = 0
    var score = 0
    
    let questions = [
        Question(q: "Which is the largest organ in the human body?",
                 a: ["Heart", "Skin", "Large Intestine"],
                 correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?",
                 a: ["25", "50", "100"],
                 correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?",
                 a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"],
                 correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?",
                 a: ["Chapeau", "Écharpe", "Bonnet"],
                 correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?",
                 a: ["Notebook", "Handkerchief", "Watch"],
                 correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?",
                 a: ["Au Revoir", "Adiós", "Salir"],
                 correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?",
                 a: ["Green", "Orange", "Blue"],
                 correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?",
                 a: ["Rum", "Whisky", "Gin"],
                 correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?",
                 a: ["Panda", "Gorilla", "Crocodile"],
                 correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?",
                 a: ["Indonesia", "Australia", "Scotland"],
                 correctAnswer: "Australia")
    ]
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == questions[qustionNumber].correctAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func getAnswer(_ buttonTag: Int) -> String {
        return questions[qustionNumber].answer[buttonTag]
    }
    
    func getProgress() -> Float {
        let result = Float(qustionNumber + 1) / Float(questions.count)
        return result
    }
    
    mutating func getQustionText() -> String {
        let result = questions[qustionNumber].text
        return result
    }
    
    mutating func nextQuestion() {
        if qustionNumber + 1 < questions.count {
            qustionNumber += 1
        } else {
            qustionNumber = 0
            score = 0
        }
    }
    
    func getSrore() -> Int {
        return score
    }
}
