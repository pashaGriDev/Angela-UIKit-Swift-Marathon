//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: -  @IBOutlet
    
    @IBOutlet weak var cornerRadiusView: UIView!
    
    @IBOutlet weak var magicBallImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var askButton: UIButton!
    
    var previousIndex = 0
    
    
    let ballArray = [#imageLiteral(resourceName: "ball1.png"), #imageLiteral(resourceName: "ball2.png"), #imageLiteral(resourceName: "ball3.png"), #imageLiteral(resourceName: "ball4.png"), #imageLiteral(resourceName: "ball5.png")]
    
    override func viewDidLoad() {
        startSetupe()
    }
    
    @IBAction func askButtonAction(_ sender: UIButton) {
        animation()
    }
    
    private func startSetupe() {
        cornerRadiusView.layer.cornerRadius = 20.0
        askButton.layer.cornerRadius = 20.0
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            animation()
        }
    }
    
    private func animation() {
        UIView.animateKeyframes(withDuration: 1, delay: 0) {
            
            var parametrs = (startTime: 0.0, x: 14.0, y: 0.0)
            for _ in 0...10 {
                UIView.addKeyframe(withRelativeStartTime: parametrs.startTime, relativeDuration: 1.0) {
                    self.magicBallImageView.transform = CGAffineTransform(translationX: parametrs.x, y: 0.0)
                }
                parametrs.startTime += 0.1
                parametrs.x = -parametrs.x
            }
        } completion: { _ in
            self.magicBallImageView.transform = .identity
            self.magicBallImageView.image = self.ballArray.randomElement()
        }
    }
}

