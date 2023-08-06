//
//  ViewController.swift
//  Quizzler-Angela-update
//
//  Created by Павел Грицков on 28.01.23.
//

import UIKit

class ViewController: UIViewController {
    
    let quizzView = QuizzView()
    var quizzBrain = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = quizzView
        addTargetButton()
        updateUI()
    }
    
    private func addTargetButton() {
        quizzView.chooseButtons.forEach { button in
            button.addTarget(self, action: #selector(didPress(_:)), for: .touchUpInside)
            }
        }
    
    @objc func didPress(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        if quizzBrain.checkAnswer(userAnswer) {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        // delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.updateUI()
        }
    }
    
    private func updateUI() {
        quizzBrain.nextQuestion()
        quizzView.qustionLabel.text = quizzBrain.getQustionText()
        quizzView.scoreLabel.text = "Score: \(quizzBrain.score)"
        
        // sets the response option for buttons
        for (index, button) in quizzView.chooseButtons.enumerated() {
            button.setTitle(
                quizzBrain.getAnswer(index),
                for: .normal)
        }
        
        quizzView.chooseButtons.forEach { button in
            button.backgroundColor = .clear
        }
        
        quizzView.progressBar.progress = quizzBrain.getProgress()
    }
}

