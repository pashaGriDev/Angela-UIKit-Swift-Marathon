//
//  Resources.swift
//  BMI-Angela-Update
//
//  Created by Павел Грицков on 31.01.23.
//

import Foundation

enum Resources {
    enum Images {
        static var calculator = "calculate_background"
        static var result = "result_background"
    }
    
    enum Advices: String {
        case weightless = "You are weightless!"
        case underweight = "Eat more peis!"
        case normal = "Fit as a fiddle!"
        case overweight = "Eat less a pies!"
    }
    
    enum BackgroundColor {
        case blue
        case green
        case red
    }
}
