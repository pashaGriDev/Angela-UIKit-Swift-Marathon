//
//  SoundButton.swift
//  Xylophone-Angela-Upgrade
//
//  Created by Павел Грицков on 24.01.23.
//

import UIKit

class SoundButton: UIButton {
    
    init(title: String?, color: UIColor?) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        backgroundColor = color
        layer.cornerRadius = 12.0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
