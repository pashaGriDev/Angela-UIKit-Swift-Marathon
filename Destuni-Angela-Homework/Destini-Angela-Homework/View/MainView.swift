//
//  MainView.swift
//  Destini-Angela-Homework
//
//  Created by Павел Грицков on 29.01.23.
//

import UIKit

class MainView: UIView {
    
    private let heightButton: CGFloat = 100
    private let offset: CGFloat = 12
    private let spacing: CGFloat = 8
    
    let storyLabel: UILabel = {
        let label = UILabel()
        label.text = "Story"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let choiceButtons: [ChoiceButton] = [.init(), .init()]
    
    init() {
        super.init(frame: .zero)
        
        [backgroundImageView, mainStackView].forEach {
            self.addSubview($0)
        }
        
        mainStackView.addArrangedSubview(storyLabel)
        choiceButtons.forEach {
            mainStackView.addArrangedSubview($0)
        }
        mainStackView.spacing = spacing
        
        setConstraint()
    }
    
    func configure(label: String, choice1: String, choice2: String) {
        storyLabel.text = label
        choiceButtons[0].setTitle(choice1, for: .normal)
        choiceButtons[1].setTitle(choice2, for: .normal)
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            backgroundImageView.rightAnchor.constraint(equalTo: self.rightAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: offset),
            mainStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -offset),
            mainStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)])
        
        choiceButtons.forEach { button in
            NSLayoutConstraint.activate([
                button.heightAnchor.constraint(equalToConstant: heightButton)])
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
