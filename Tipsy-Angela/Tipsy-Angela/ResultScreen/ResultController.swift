//
//  ResultController.swift
//  Tipsy-Angela
//
//  Created by Павел Грицков on 15.02.23.
//

import UIKit

class ResultController: UIViewController {
    
    private let resultView = ResultView()
    
    var total = 0
    
    var brain: Brain?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        updateUI()
    }
}

private extension ResultController {
    
    func updateUI() {
        if let brain {
            resultView.configureTotalLabel(brain.getTotaleBill())
            resultView.configureLabel(between: brain.bill.person, tips: brain.bill.tips)
        }
    }
    
    func setup() {
        view = resultView
        
        resultView.recalculateButton.addTarget(
            self,
            action: #selector(recalculateButtonDidPress),
            for: .touchUpInside)
    }
}

@objc extension ResultController {
    
    func recalculateButtonDidPress() {
        dismiss(animated: true)
    }
}
