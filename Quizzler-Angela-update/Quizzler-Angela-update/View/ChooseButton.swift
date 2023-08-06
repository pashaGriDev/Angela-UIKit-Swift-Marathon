//
//  ChooseButton.swift
//  Quizzler-Angela-update
//
//  Created by Павел Грицков on 28.01.23.
//

import UIKit

class ChooseButton: UIButton {
    
    init() {
        super.init(frame: .zero)
        
        setTitle("button", for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 22)
        titleLabel?.textAlignment = .center
        
        layer.cornerRadius = 20
        
        layer.borderWidth = 5
        layer.borderColor = UIColor.lightGray.cgColor  
    }
    
    func configure(_ title: String, color: UIColor) {
        self.setTitle(title, for: .normal)
        self.backgroundColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
