//
//  ResultView.swift
//  BMI-Angela-Update
//
//  Created by Павел Грицков on 31.01.23.
//

import UIKit

class ResultView: UIView {
    
    private let offset: CGFloat = 16.0
    private let h1FontSize: CGFloat = 80
    private let h3FontSize: CGFloat = 40
    private let h4FontSize: CGFloat = 30
    
    private let backgroundImageView = UIImageView()
    
    private let stackContainer = UIStackView()
    private let yourResultLabel = UILabel()
    
    let resultBMILabel = UILabel()
    let adviceLabel = UILabel()
    
    let navButton = UIButton(type: .system)

    init() {
        super.init(frame: .zero)
        
        setup()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.backgroundColor = .lightGray
        self.addSubview(backgroundImageView)
        setupBackgroundImageView()
        setupStackContainer()
        setupYourResultLabel()
        setupResultBMILabel()
        setupAdviceLabel()
        setupNavButton()
    }
    
    private func setupNavButton() {
        navButton.setTitle("RECALCULATE", for: .normal)
        navButton.setTitleColor(UIColor.purple1, for: .normal)
        navButton.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        navButton.backgroundColor = .white
        navButton.layer.cornerRadius = 8
        navButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(navButton)
        
        NSLayoutConstraint.activate([
            navButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: offset),
            navButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -offset),
            navButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            navButton.heightAnchor.constraint(equalToConstant: 55)])
    }
    
    private func setupResultBMILabel() {
        resultBMILabel.text = "19.0"
        resultBMILabel.textAlignment = .center
        resultBMILabel.textColor = .white
        resultBMILabel.font = UIFont.boldSystemFont(ofSize: h1FontSize)
        
        stackContainer.addArrangedSubview(resultBMILabel)
    }
    
    private func setupAdviceLabel() {
        adviceLabel.text = "Advice"
        adviceLabel.textAlignment = .center
        adviceLabel.textColor = .white
        adviceLabel.font = UIFont.systemFont(ofSize: h4FontSize)
        
        stackContainer.addArrangedSubview(adviceLabel)
    }
    
    private func setupYourResultLabel() {
        yourResultLabel.text = "YOUR RESULT"
        yourResultLabel.textAlignment = .center
        yourResultLabel.textColor = .white
        yourResultLabel.font = UIFont.boldSystemFont(ofSize: h3FontSize)
        
        stackContainer.addArrangedSubview(yourResultLabel)
    }
    
    private func setupStackContainer() {
        stackContainer.axis = .vertical
        stackContainer.spacing = 8
        stackContainer.distribution = .fill
        stackContainer.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(stackContainer)
        
        NSLayoutConstraint.activate([
            stackContainer.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackContainer.centerYAnchor.constraint(equalTo: self.centerYAnchor)])
    }
    
    private func setupBackgroundImageView() {
        backgroundImageView.image = UIImage(named: Resources.Images.result)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(backgroundImageView)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            backgroundImageView.rightAnchor.constraint(equalTo: self.rightAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }
    
}
