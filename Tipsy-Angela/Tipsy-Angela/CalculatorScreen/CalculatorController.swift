//
//  StartController.swift
//  Tipsy-Angela
//
//  Created by Павел Грицков on 15.02.23.
//

import UIKit

class CalculatorController: UIViewController {

    private let calculatorView = CalculatorView()
    private var brain = Brain()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // close keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}


private extension CalculatorController {
    
    func setup() {
        view = calculatorView
        
        calculatorView.billTextField.delegate = self
        
        calculatorView.ptcButtons.forEach {
            $0.addTarget(self, action: #selector(buttonDidPress), for: .touchUpInside)
        }
        
        calculatorView.calculateButton.addTarget(self, action: #selector(calculateButtonDidPress), for: .touchUpInside)
        
        calculatorView.stepper.addTarget(self, action: #selector(stepperDidChange), for: .valueChanged)
    }
}

@objc extension CalculatorController {
    func buttonDidPress(_ sender: UIButton) {
        
        calculatorView.billTextField.endEditing(true)
        
        print("show : \(brain.checkUserSelection(sender.currentTitle))")
        
        calculatorView.ptcButtons.forEach { button in
            if sender == button {
                button.isSelected = true
                button.setTitleColor(.white, for: .normal)
            } else {
                button.isSelected = false
                button.setTitleColor(.customGreen1, for: .normal)
            }
        }
    }
    
    func stepperDidChange(_ sender: UIStepper) {
        calculatorView.splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    func calculateButtonDidPress() {
        
        if brain.bill.totat <= 0 {
            print("Wrong!!!")
        } else {
            // number of persons
            brain.bill.person = Int(calculatorView.stepper.value)
            
            // user select tips
            calculatorView.ptcButtons.forEach { button in
                if button.isSelected {
                    brain.checkUserSelection(button.currentTitle)
                }
            }
            
            let resultVC = ResultController()
            resultVC.brain = self.brain
            resultVC.modalPresentationStyle = .fullScreen
            show(resultVC, sender: nil)
        }
    }
}

extension CalculatorController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return brain.isValidCharacter(string)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let bill = textField.text, brain.isValidBill(bill) {
            brain.giveTotal(bill: bill)
        } else {
            print("Wrong!!!")
        }
    }
    
    // очищает textField когда начинается редоктирование
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
}
