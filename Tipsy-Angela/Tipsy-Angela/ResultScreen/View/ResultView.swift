//
//  ResultView.swift
//  Tipsy-Angela
//
//  Created by Павел Грицков on 15.02.23.
//

import UIKit

class ResultView: UIView {
    
    private let greenView = UIView()
    
    private let titleTotalLabel = UILabel()
    private let totalLabel = UILabel()
    
    private let splitBetweenLabel = UILabel()
    
    let recalculateButton = UIButton(type: .system)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        setupGreenView()
        setupTitleTotalLabel()
        setupTotalLabel()
        setupSplitBetweenLabel()
        setupCalculateButton()
        
        setConstraints()
    }
    
    func configureLabel(between people: Int, tips: Double) {
        
        let stringTips = String(tips * 100) + "%"
        splitBetweenLabel.text = "Split between \(people) people, with \(stringTips) tip."
    }
    
    func configureTotalLabel(_ total: Double) {
        totalLabel.text = String(format: "%.3f", total)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ResultView {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            greenView.heightAnchor.constraint(equalToConstant: 300),
            greenView.topAnchor.constraint(equalTo: topAnchor),
            greenView.leadingAnchor.constraint(equalTo: leadingAnchor),
            greenView.trailingAnchor.constraint(equalTo: trailingAnchor),
        
            titleTotalLabel.centerYAnchor.constraint(equalTo: greenView.centerYAnchor),
            titleTotalLabel.leadingAnchor.constraint(equalTo: greenView.leadingAnchor),
            titleTotalLabel.trailingAnchor.constraint(equalTo: greenView.trailingAnchor),
            
            totalLabel.heightAnchor.constraint(equalToConstant: 100),
            totalLabel.topAnchor.constraint(equalTo: titleTotalLabel.bottomAnchor),
            totalLabel.leadingAnchor.constraint(equalTo: greenView.leadingAnchor, constant: 10),
            greenView.trailingAnchor.constraint(equalTo: totalLabel.trailingAnchor, constant: 10),
            
            splitBetweenLabel.topAnchor.constraint(equalTo: greenView.bottomAnchor, constant: Size.mainSpacing / 2),
            splitBetweenLabel.heightAnchor.constraint(equalToConstant: 117),
            splitBetweenLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            trailingAnchor.constraint(equalTo: splitBetweenLabel.trailingAnchor, constant: 50),
            
            recalculateButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            recalculateButton.heightAnchor.constraint(equalToConstant: Size.Button.heightNav),
            recalculateButton.widthAnchor.constraint(greaterThanOrEqualToConstant: Size.Button.widthNavMin),
            recalculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupTitleTotalLabel() {
        titleTotalLabel.text = "Enter bill total"
        titleTotalLabel.textColor = .lightGray
        titleTotalLabel.textAlignment = .center
        titleTotalLabel.font = UIFont.systemFont(ofSize: Size.FontSize.title)
        
        greenView.setupView(titleTotalLabel)
    }
    
    func setupTotalLabel() {
        totalLabel.text = "0"
        totalLabel.font = UIFont.boldSystemFont(ofSize: 45)
        totalLabel.textAlignment = .center
        totalLabel.textColor = .customGreen1
        
        greenView.setupView(totalLabel)
    }
    
    func setupSplitBetweenLabel() {
        splitBetweenLabel.text = "Split between 2 people"
        splitBetweenLabel.textColor = .lightGray
        splitBetweenLabel.textAlignment = .center
        splitBetweenLabel.numberOfLines = 2
        splitBetweenLabel.font = UIFont.systemFont(ofSize: Size.FontSize.title)
        
        setupView(splitBetweenLabel)
    }
    
    func setupGreenView() {
        greenView.backgroundColor = .customGreen2
        
        setupView(greenView)
    }
    
    func setupCalculateButton() {
        recalculateButton.setTitle("Recalculate", for: .normal)
        recalculateButton.setTitleColor(.white, for: .normal)
        recalculateButton.titleLabel?.font = UIFont.systemFont(ofSize: Size.FontSize.buttonNav)
        recalculateButton.backgroundColor = .customGreen1
        
        setupView(recalculateButton)
    }
}
