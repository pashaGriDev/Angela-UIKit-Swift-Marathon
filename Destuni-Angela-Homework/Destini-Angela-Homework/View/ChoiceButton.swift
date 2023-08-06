//
//  ChoiceButton.swift
//  Destini-Angela-Homework
//
//  Created by Павел Грицков on 29.01.23.
//

import UIKit

class ChoiceButton: UIButton {
    
    private static var id = 0
    
    convenience init() {
        self.init(type: .system)
        setImage()
        setTitle("Choice", for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        titleLabel?.numberOfLines = 2
        titleLabel?.textAlignment = .center
    }
    
    private func setImage() {
        switch ChoiceButton.id {
        case 0:
            setBackgroundImage(UIImage(named: Images.choiceButton1), for: .normal)
        default:
            setBackgroundImage(UIImage(named: Images.choiceButton2), for: .normal)
        }
    }
}

