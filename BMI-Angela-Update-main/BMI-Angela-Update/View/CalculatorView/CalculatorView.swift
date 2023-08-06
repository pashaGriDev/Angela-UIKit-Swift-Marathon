//
//  CalculatorView.swift
//  BMI-Angela-Update
//
//  Created by Павел Грицков on 31.01.23.
//

import UIKit

final class CalculatorView: UIView {
    
    private let offset: CGFloat = 16.0
    private let titleFontSize: CGFloat = 50.0
    private let markFontSize: CGFloat = 14.0
    
    private let backgroundImageView = UIImageView()
    
    private let stackContainer = UIStackView()
    private let stackContainerHeight = UIStackView()
    private let stackContainerWeight = UIStackView()
    
    private let titleLabel = UILabel()
    private let heightLabel = UILabel()
    private let weightLabel = UILabel()
    
    let heightValueLabel = UILabel()
    let weightValueLabel = UILabel()
    
    let heightSlider = UISlider()
    let weightSlider = UISlider()
    
    let navButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setup()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.backgroundColor = .white
        setupBackgroundImageView()
        setupStackContainer()
        setupTitleLabel()
        setupStackContainerHeight()
        setupHeightLabel()
        setupHeightValueLabel()
        setupHeightSlider()
        setupStackContainerWeight()
        setupWeightLabel()
        setupWeightValueLabel()
        setupWeightSlider()
        setupNavButton()
    }
    
    private func setupNavButton() {
        navButton.setTitle("CALCULATE", for: .normal)
        navButton.setTitleColor(.white, for: .normal)
        navButton.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        navButton.backgroundColor = UIColor.purple1
        navButton.layer.cornerRadius = 8
        
        stackContainer.addArrangedSubview(navButton)
        
        NSLayoutConstraint.activate([
            navButton.heightAnchor.constraint(equalToConstant: 55)])
    }
    
    private func setupWeightSlider() {
        weightSlider.maximumValue = 200
        weightSlider.minimumValue = 0
        weightSlider.value = weightSlider.maximumValue / 2
        weightSlider.minimumTrackTintColor = UIColor.purple2
        weightSlider.maximumTrackTintColor = UIColor.gray10
        weightSlider.thumbTintColor = UIColor.purple2
        
        stackContainer.addArrangedSubview(weightSlider)
        
        NSLayoutConstraint.activate([
            weightSlider.topAnchor.constraint(equalTo: stackContainerWeight.bottomAnchor)])
    }
    
    private func setupWeightValueLabel() {
        weightValueLabel.text = "100Kg"
        weightValueLabel.textAlignment = .right
        weightValueLabel.textColor = .gray
        weightValueLabel.font = UIFont.systemFont(ofSize: markFontSize)
        
        stackContainerWeight.addArrangedSubview(weightValueLabel)
    }
    
    private func setupWeightLabel() {
        weightLabel.text = "Weight"
        weightLabel.textAlignment = .left
        weightLabel.textColor = .gray
        weightLabel.font = UIFont.systemFont(ofSize: markFontSize)
        
        stackContainerWeight.addArrangedSubview(weightLabel)
    }
    
    private func setupStackContainerWeight() {
        stackContainerWeight.axis = .horizontal
        stackContainerWeight.distribution = .fillEqually
        
        NSLayoutConstraint.activate([
            stackContainerWeight.heightAnchor.constraint(equalToConstant: 40)])
        stackContainer.addArrangedSubview(stackContainerWeight)
    }
    
    private func setupHeightSlider() {
        heightSlider.maximumValue = 3.0
        heightSlider.minimumValue = 0.0
        heightSlider.value = heightSlider.maximumValue / 2
        heightSlider.minimumTrackTintColor = UIColor.purple2
        heightSlider.maximumTrackTintColor = UIColor.gray10
        heightSlider.thumbTintColor = UIColor.purple2
        
        stackContainer.addArrangedSubview(heightSlider)
        
        NSLayoutConstraint.activate([
            heightSlider.topAnchor.constraint(equalTo: stackContainerHeight.bottomAnchor)])
    }
    
    private func setupHeightValueLabel() {
        heightValueLabel.text = "1.5m"
        heightValueLabel.textAlignment = .right
        heightValueLabel.textColor = .gray
        heightValueLabel.font = UIFont.systemFont(ofSize: markFontSize)
        
        stackContainerHeight.addArrangedSubview(heightValueLabel)
    }
    
    private func setupHeightLabel() {
        heightLabel.text = "Height"
        heightLabel.textAlignment = .left
        heightLabel.textColor = .gray
        heightLabel.font = UIFont.systemFont(ofSize: markFontSize)
        
        stackContainerHeight.addArrangedSubview(heightLabel)
    }
    
    private func setupStackContainerHeight() {
        stackContainerHeight.axis = .horizontal
        stackContainerHeight.distribution = .fillEqually
        
        NSLayoutConstraint.activate([
            stackContainerHeight.heightAnchor.constraint(equalToConstant: 40)])
        stackContainer.addArrangedSubview(stackContainerHeight)
    }
    
    private func setupTitleLabel() {
        titleLabel.text = "CALCULATE YOUR BMI"
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 2
        titleLabel.textColor = UIColor.darkGray
        titleLabel.font = UIFont.boldSystemFont(ofSize: titleFontSize)
        
        stackContainer.addArrangedSubview(titleLabel)
    }
    
    private func setupStackContainer() {
        stackContainer.axis = .vertical
        stackContainer.spacing = 30
        stackContainer.distribution = .fill
        stackContainer.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(stackContainer)
        
        NSLayoutConstraint.activate([
            stackContainer.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            stackContainer.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: offset),
            stackContainer.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -offset),
            stackContainer.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)])
    }
    
    private func setupBackgroundImageView() {
        backgroundImageView.image = UIImage(named: Resources.Images.calculator)
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
