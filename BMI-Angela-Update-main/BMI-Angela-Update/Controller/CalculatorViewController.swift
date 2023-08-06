//
//  CalculatorViewController.swift
//  BMI-Angela-Update
//
//  Created by Павел Грицков on 31.01.23.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    let calculatorView = CalculatorView()
    var brain = CalculatorBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = calculatorView
        addTartetButton()
        addTargetSlider()
    }
    
    private func addTartetButton() {
        calculatorView.navButton.addTarget(self, action: #selector(didPress), for: .touchUpInside)
    }
    
    @objc
    func didPress(_ sender: UIButton) {
        brain.calculatorBMI(
            calculatorView.heightSlider.value,
            calculatorView.weightSlider.value)
        
        let resultVC = ResultViewController()
        resultVC.bmi = brain.getBMI()
        resultVC.modalPresentationStyle = .fullScreen
        self.present(resultVC, animated: true)
    }
    
    private func addTargetSlider() {
        [calculatorView.heightSlider, calculatorView.weightSlider].forEach { slider in
            slider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        }
    }
    
    @objc
    func sliderChanged(_ sender: UISlider) {
        if sender == calculatorView.heightSlider {
            let height = String(format: "%.2f", sender.value)
            calculatorView.heightValueLabel.text = height + "m"
        } else {
            let weight = String(format: "%.0f", sender.value)
            calculatorView.weightValueLabel.text = weight + "Kg"
        }
    }
}
