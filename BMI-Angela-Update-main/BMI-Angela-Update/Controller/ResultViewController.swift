//
//  ResultViewController.swift
//  BMI-Angela-Update
//
//  Created by Павел Грицков on 31.01.23.
//

import UIKit

class ResultViewController: UIViewController {
    
    let resultView = ResultView()
    var bmi: BMI?

    override func viewDidLoad() {
        super.viewDidLoad()
        view = resultView
        addTargetButton()
        configure()
    }
    
    private func configure() {
        if let bmi {
            let bmiString = String(format: "%.1f", bmi.value)
            resultView.resultBMILabel.text = bmiString
            resultView.adviceLabel.text = bmi.advice.rawValue
            resultView.backgroundColor = .backgroundColor(color: bmi.color)
        } else {
            print("Wrong!")
        }
    }
    
    private func addTargetButton() {
        resultView.navButton.addTarget(self, action: #selector(didPress), for: .touchUpInside)
    }
    
    @objc
    func didPress() {
        self.dismiss(animated: true)
    }
}
