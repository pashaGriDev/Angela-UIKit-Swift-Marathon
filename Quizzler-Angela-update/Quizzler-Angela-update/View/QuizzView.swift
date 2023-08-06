//
//  QuizzGameView.swift
//  Quizzler-Angela-update
//
//  Created by Павел Грицков on 28.01.23.
//

import UIKit

class QuizzView: UIView {
    
    private let scoreHeight: CGFloat = 40
    private let buttonHeight: CGFloat = 80
    private let offset: CGFloat = 12
    private let spacing: CGFloat = 8
    
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Srore: 0"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let qustionLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 22)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let chooseButtons: [ChooseButton] = [.init(), .init() , .init()]
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // progressView
    let progressBar: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.trackTintColor = .lightGray
        progress.tintColor = #colorLiteral(red: 0.4494172335, green: 0.728700161, blue: 0.9992223382, alpha: 1)
        return progress
    }()
    
    private  let backgroundBottomImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Background-Bubbles")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = #colorLiteral(red: 0.1932204366, green: 0.2285295725, blue: 0.3628596961, alpha: 1)
        self.addSubview(backgroundBottomImage)
        
        // add sud view
        mainStackView.spacing = spacing
        [scoreLabel, qustionLabel].forEach { view in
            mainStackView.addArrangedSubview(view)
        }
        chooseButtons.forEach { button in
            mainStackView.addArrangedSubview(button)
        }
        mainStackView.addArrangedSubview(progressBar)
        
        self.addSubview(mainStackView)
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraint() {
        
        NSLayoutConstraint.activate([
            backgroundBottomImage.widthAnchor.constraint(equalTo: self.widthAnchor),
            backgroundBottomImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            backgroundBottomImage.heightAnchor.constraint(equalToConstant: 100),
            backgroundBottomImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: offset),
            mainStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -offset),
            mainStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        
            scoreLabel.heightAnchor.constraint(equalToConstant: scoreHeight),
        
            progressBar.heightAnchor.constraint(equalToConstant: 4)])
        
        chooseButtons.forEach { button in
            button.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        }
    }
    
    func configure() {
        // 
    }
    
}
