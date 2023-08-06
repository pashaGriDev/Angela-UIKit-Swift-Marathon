//
//  ChooseButton.swift
//  Quizzler-Angela-update
//
//  Created by Павел Грицков on 28.01.23.
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.answer = a
        self.correctAnswer = correctAnswer
    }
}
