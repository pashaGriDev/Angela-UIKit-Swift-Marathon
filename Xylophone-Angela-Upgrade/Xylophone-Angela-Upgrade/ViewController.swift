//
//  ViewController.swift
//  Xylophone-Angela-Upgrade
//
//  Created by Павел Грицков on 24.01.23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // MARK: - Constants
    
    let offsetButton: CGFloat = 50.0
    var multi: CGFloat = 0.2
    let step: CGFloat = 0.1
    let stackViewSpacing: CGFloat = 14
    
    var player: AVAudioPlayer!
    
    let soundButtons: [SoundButton] = [
        .init(title: "C", color: .colorC),
        .init(title: "D", color: .colorD),
        .init(title: "E", color: .colorE),
        .init(title: "F", color: .colorF),
        .init(title: "G", color: .colorG),
        .init(title: "A", color: .colorA),
        .init(title: "B", color: .colorB)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        settingsForStackView()
        offsetSoundButton()
    }
    
    // MARK: - Methods
    
    private func setup() {
        
        view.backgroundColor = .white
        
        soundButtons.forEach {
            $0.addTarget(self, action: #selector(didPressed), for: .touchUpInside)
        }
    }
    
    private func settingsForStackView() {
        
        let stackView = UIStackView(arrangedSubviews: soundButtons)
        
        stackView.axis = .vertical
        stackView.spacing = stackViewSpacing
        stackView.distribution = .fillEqually
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
    
    private func offsetSoundButton() {
        soundButtons.forEach {
            let offset = offsetButton * multi
            NSLayoutConstraint.activate([
                $0.leftAnchor.constraint(equalTo: view.leftAnchor, constant: offset),
                $0.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -offset)])
            multi += step
        }
    }
    
    @objc func didPressed(_ sender: UIButton) {
        if let title = sender.currentTitle {
            playSound(title)
            animateFor(button: sender)
        }
    }
    
    func playSound(_ note: String) {
        guard let path = Bundle.main.path(forResource: note, ofType: "wav") else { return }
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - Animate
    
    private func animateFor(button: UIButton) {
        UIView.animate(withDuration: 0.1, delay: 0.0) {
            button.transform = .init(scaleX: 1.05, y: 1.05)
        }completion: { _ in
            button.transform = .identity
        }
    }
}

