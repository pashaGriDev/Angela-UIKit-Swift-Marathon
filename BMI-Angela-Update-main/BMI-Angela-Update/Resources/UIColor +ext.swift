//
//  UIColor +ext.swift
//  BMI-Angela-Update
//
//  Created by Павел Грицков on 31.01.23.
//

import UIKit

extension UIColor {
    
    static var purple1: UIColor {
        #colorLiteral(red: 0.385181427, green: 0.3802323341, blue: 0.6122558117, alpha: 1)
    }
    static var purple2: UIColor {
        #colorLiteral(red: 0.6352868676, green: 0.6352999806, blue: 0.8727077842, alpha: 1)
    }
    
    static var gray10: UIColor {
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    static func backgroundColor(color: Resources.BackgroundColor) -> UIColor {
        var result: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        switch color {
        case .blue:
            result = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        case .green:
            result = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        case .red:
            result = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        }
        return result
    }
}
