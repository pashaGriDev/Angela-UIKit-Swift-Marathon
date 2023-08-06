//
//  CalculatorBrain.swift
//  BMI-Angela-Update
//
//  Created by Павел Грицков on 31.01.23.
//

import Foundation

struct CalculatorBrain {
    
    var bmi: BMI?
    
    mutating func calculatorBMI(_ height: Float,_ weight: Float) {
        let bmiValue = weight / pow(height, 2)
        createBMI(bmiValue)
    }
    
    func getBMI() -> BMI? {
        return bmi
    }
    
    private mutating func createBMI(_ bmi: Float)  {
        
        if bmi.isNaN {
            self.bmi = BMI(value: 0.0, advice: .weightless, color: .blue)
        }
        
        switch bmi {
        case ..<18.5:
            self.bmi = BMI(value: bmi, advice: .underweight, color: .blue)
        case 18.5...24.9:
            self.bmi = BMI(value: bmi, advice: .normal, color: .green)
        case 25... :
            self.bmi = BMI(value: bmi, advice: .overweight, color: .red)
        default:
            break
        }
    }
    
}
