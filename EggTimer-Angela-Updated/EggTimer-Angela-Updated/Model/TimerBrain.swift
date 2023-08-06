//
//  TimerBrain.swift
//  EggTimer-Angela-Updated
//
//  Created by Павел Грицков on 29.01.23.
//

import Foundation

struct TimerBrain {

    let eggs: [Egg] = [
        .init(harness: "Soft", image: "soft_egg", cookingTime: 13),
        .init(harness: "Medium", image: "medium_egg", cookingTime: 15),
        .init(harness: "Hard", image: "hard_egg", cookingTime: 17)]
    
    func check(currentEgg: String?) -> Egg? {
        var result: Egg?
        for egg in eggs {
            if let value = currentEgg,
                value == egg.harness {
                result = egg
            }
        }
        return result
    }
}

protocol MyTimerDelegate {
    func timer()
}

class MyTimer {
    
    var timer = Timer()
    
    var totalTime = 0
    var timeUp = false
    
    var secondsPassed = 0 {
        didSet {
            if totalTime == oldValue {
                timer.invalidate()
                timeUp = true
                print("Timer DONE!!!")
            }
        }
    }
    
    var progress: Float {
        return Float(secondsPassed) / Float(totalTime)
    }
    
    var delegate: MyTimerDelegate?
    
    func createTimer() {
        
        secondsPassed = 0
        
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(countdownTimer),
            userInfo: nil,
            repeats: true)
        timer.tolerance = 0.2
    }
    
    func stopTimer() {
        timer.invalidate()
    }
    
    @objc func countdownTimer() {
        delegate?.timer()
        secondsPassed += 1
    }
}

