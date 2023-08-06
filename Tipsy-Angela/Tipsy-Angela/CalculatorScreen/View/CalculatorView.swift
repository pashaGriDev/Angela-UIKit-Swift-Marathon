//
//  ClaculatorView.swift
//  Tipsy-Angela
//
//  Created by Павел Грицков on 15.02.23.
//

import UIKit


class CalculatorView: UIView {
    
    private lazy var greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .customGreen2
        setupView(view)
        return view
    }()
    
    private let topStackView = UIStackView()
    private let titleTotalLabel = UILabel()
    let billTextField = UITextField()
    
    private let stackView = UIStackView()
    
    private let tipLabel = UILabel()
    
    private let buttonsStackView = UIStackView()
    var ptcButtons: [UIButton] = []
    
    private let titleSplitLabel = UILabel()
    
    private let stepperStackView = UIStackView()
    let splitNumberLabel = UILabel()
    let stepper = UIStepper()
    
    let calculateButton = UIButton(type: .system)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupTopStackView()
        setupTitleTotalLabel()
        setupBillTextField()
        
        // elements from the greenView
        setupStackView()
        
        // elements from the stackView
        setupTipLabel()
        setupButtonsStackView()
        setupPtcButtons()
        setupTitleSplitLabel()
        setupStepperStackView()
        setupSplitNumberLabel()
        setupStepper()
        
        setupCalculateButton()
        
        setConstraints()
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Size.StackView.offset / 2),
            topStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            // linked to superview, stackView alignment = center
            titleTotalLabel.heightAnchor.constraint(equalToConstant: Size.Label.height),
            titleTotalLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Size.Label.offset),
            trailingAnchor.constraint(equalTo: titleTotalLabel.trailingAnchor, constant: Size.Label.offset),
            
            // linked to superview, stackView alignment = center
            billTextField.heightAnchor.constraint(equalToConstant: Size.TextField.height),
            billTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Size.TextField.offset),
            trailingAnchor.constraint(equalTo: billTextField.trailingAnchor, constant: Size.TextField.offset),
            
            greenView.topAnchor.constraint(equalTo: billTextField.bottomAnchor, constant: Size.mainSpacing),
            greenView.leadingAnchor.constraint(equalTo: leadingAnchor),
            greenView.trailingAnchor.constraint(equalTo: trailingAnchor),
            greenView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: greenView.topAnchor, constant: Size.mainSpacing),
            stackView.leadingAnchor.constraint(equalTo: greenView.leadingAnchor, constant: Size.StackView.offset),
            greenView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: Size.StackView.offset),
            
            // linked to superview, stackView alignment = center
            tipLabel.heightAnchor.constraint(equalToConstant: Size.Label.height),
            tipLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Size.Label.offset),
            trailingAnchor.constraint(equalTo: tipLabel.trailingAnchor, constant: Size.Label.offset),
            
            // linked to superview, stackView (the stackView) alignment = center
            buttonsStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            // b1 width is equal to 30% of buttonsStackView width
            ptcButtons[0].heightAnchor.constraint(equalToConstant: Size.Button.height),
            ptcButtons[0].widthAnchor.constraint(equalTo: buttonsStackView.widthAnchor, multiplier: 0.3),
            ptcButtons[0].heightAnchor.constraint(equalToConstant: Size.Button.height),
            ptcButtons[2].heightAnchor.constraint(equalToConstant: Size.Button.height),
            ptcButtons[2].widthAnchor.constraint(equalTo: ptcButtons[0].widthAnchor),
            
            // linked to superview, stackView alignment = center
            titleSplitLabel.heightAnchor.constraint(equalToConstant: Size.Label.height),
            titleSplitLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Size.Label.offset),
            trailingAnchor.constraint(equalTo: titleSplitLabel.trailingAnchor, constant: Size.Label.offset),
            
            calculateButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            calculateButton.heightAnchor.constraint(equalToConstant: Size.Button.heightNav),
            calculateButton.widthAnchor.constraint(greaterThanOrEqualToConstant: Size.Button.widthNavMin),
            calculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
 

private extension CalculatorView {
    
    func setupTopStackView() {
        topStackView.axis = .vertical
        topStackView.distribution = .fill
        topStackView.alignment = .center
        topStackView.spacing = Size.mainSpacing
        
        setupView(topStackView)
    }
    
    func setupTitleTotalLabel() {
        titleTotalLabel.text = "Enter bill total"
        titleTotalLabel.textColor = .lightGray
        titleTotalLabel.font = UIFont.systemFont(ofSize: Size.FontSize.title)
        
        topStackView.addArrangedSubview(titleTotalLabel)
    }
    
    func setupBillTextField() {
        billTextField.placeholder = "e.g 123.56"
        billTextField.textColor = .darkGray
        billTextField.font = UIFont.systemFont(ofSize: Size.FontSize.textField)
        billTextField.keyboardType = .decimalPad
        billTextField.textAlignment = .center
//        billTextField.clearButtonMode = .always
        
        topStackView.addArrangedSubview(billTextField)
    }
    
    func setupStackView() {
        stackView.spacing = Size.mainSpacing
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        greenView.addSubview(stackView)
    }
    
    func setupTipLabel() {
        tipLabel.text = "Select tip"
        tipLabel.textColor = .lightGray
        tipLabel.font = UIFont.systemFont(ofSize: Size.FontSize.title)
        
        stackView.addArrangedSubview(tipLabel)
    }
    
    func setupButtonsStackView() {
        buttonsStackView.distribution = .fillProportionally
        buttonsStackView.alignment = .fill
        
        stackView.addArrangedSubview(buttonsStackView)
    }
    
    func setupPtcButtons() {
        [0, 10, 20].forEach { percent in
            let button = UIButton(type: .system)
            button.setTitle("\(percent)%", for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: Size.FontSize.button)
            button.contentMode = .scaleAspectFit
            
            
            button.setTitleColor(.customGreen1, for: .normal)
            button.tintColor = .customGreen1
            
            // selected a button
            if percent == 10 {
                button.isSelected = true
                button.setTitleColor(.white, for: .normal)
            }
            
            buttonsStackView.addArrangedSubview(button)
            
            ptcButtons.append(button)
        }
    }
    
    func setupTitleSplitLabel() {
        titleSplitLabel.text = "Choose Split"
        titleSplitLabel.textColor = .lightGray
        titleSplitLabel.font = UIFont.systemFont(ofSize: Size.FontSize.title)
        
        stackView.addArrangedSubview(titleSplitLabel)
    }
    
    func setupStepperStackView() {
        stepperStackView.distribution = .fillEqually
        stepperStackView.alignment = .fill
        stepperStackView.spacing = Size.mainSpacing / 2
        
        stackView.addArrangedSubview(stepperStackView)
    }
    
    func setupSplitNumberLabel() {
        splitNumberLabel.text = "2"
        splitNumberLabel.textColor = .customGreen1
        splitNumberLabel.font = UIFont.systemFont(ofSize: Size.FontSize.button)
        splitNumberLabel.textAlignment = .center
        
        stepperStackView.addArrangedSubview(splitNumberLabel)
    }
    
    func setupStepper() {
        stepper.value = 2
        stepper.minimumValue = 2
        stepper.maximumValue = 25
        stepper.stepValue = 1
        stepperStackView.addArrangedSubview(stepper)
    }
    
    func setupCalculateButton() {
        calculateButton.setTitle("Calculate", for: .normal)
        calculateButton.setTitleColor(.white, for: .normal)
        calculateButton.titleLabel?.font = UIFont.systemFont(ofSize: Size.FontSize.buttonNav)
        calculateButton.backgroundColor = .customGreen1
        
        setupView(calculateButton)
    }
}



