//
//  Brain.swift
//  Tipsy-Angela
//
//  Created by Павел Грицков on 15.02.23.
//

import Foundation

struct Brain {
    
    var bill = Bill()
    
    func getTotaleBill() -> Double {
        let result = (bill.totat + (bill.totat * bill.tips)) / Double(bill.person)
        return result
    }
    
    
    mutating func giveTotal(bill stringBill: String) {
        if let dobleBill = Double(stringBill) {
            bill.totat = dobleBill
        }
    }
    
    func isValidBill(_ stringBill: String) -> Bool {
        var result = false
        
        if stringBill != "",
            let dobleBill = Double(stringBill),
                dobleBill > 0.1 {
            result = true
        }
        
        return result
    }
    
    func isValidCharacter(_ string: String) -> Bool {
        var isValid = false
        
        if let numder = Int(string) {
            switch numder {
            case 0..<10 : isValid = true
            default: isValid = false
            }
        }
        
        if string == "." {
            isValid = true
        }
        
        return isValid
    }
    
    mutating func checkUserSelection(_ currentTitle: String?) {
        var result = 0.0
        
        if let title = currentTitle {
            switch title {
            case "10%": result = 0.1
            case "20%": result = 0.2
            default: result = 0.0
            }
        }
        
        bill.tips = result
    }
}
