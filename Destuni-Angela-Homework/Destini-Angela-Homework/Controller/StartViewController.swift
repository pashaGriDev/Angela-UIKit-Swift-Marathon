//
//  StartViewController.swift
//  Destini-Angela-Homework
//
//  Created by Павел Грицков on 29.01.23.
//

import UIKit

class StartViewController: UIViewController {
    
    let mainView = MainView()
    var storyBrain = StoryBrain()
    var numberStory = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        
        mainView.choiceButtons.forEach { button in
            button.addTarget(self, action: #selector(didChoiceStory), for: .touchUpInside)
        }
        
        updateUI()
    }
    
    @objc func didChoiceStory(_ sender: UIButton) {
        if let userChoice = sender.currentTitle {
            storyBrain.check(userCoice: userChoice)
            updateUI()
        }
    }
    
    func updateUI() {
        let story = storyBrain.nextStory()
        mainView.configure(
            label: story.title,
            choice1: story.choice1,
            choice2: story.choice2)
    }
}

