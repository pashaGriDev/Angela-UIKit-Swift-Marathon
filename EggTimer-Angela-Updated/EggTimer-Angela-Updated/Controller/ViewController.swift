//
//  ViewController.swift
//  EggTimer-Angela-Updated
//
//  Created by Павел Грицков on 24.01.23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, MyTimerDelegate {
    
    // MARK: - Constants
    
    let timerBrain = TimerBrain()
    let myTimer = MyTimer()
    
    let offset: CGFloat = 8.0

    var player: AVAudioPlayer!
    
    // eggs place
    let eggViews: [EggView] = [.init(), .init(), .init()]
    
    let progressView: UIProgressView = {
        let progress = UIProgressView()
        progress.progressViewStyle = .default
        progress.trackTintColor = .systemGray6
        progress.progressTintColor = .orange
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    let titleLable: UILabel = {
        let lable = UILabel()
        lable.text = "How do you like your eggs?"
        lable.font = UIFont.systemFont(ofSize: 26)
        lable.textAlignment = .center
        lable.numberOfLines = 0
        return lable
    }()
    
    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = offset
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupe()
        setConstraints()
        myTimer.delegate = self
    }
    
    // MARK: - Start setup

    func setupe() {
        view.backgroundColor = .white
        view.addSubview(mainStackView)
        
        let boxForProgressView = UIView()
        boxForProgressView.addSubview(progressView)
        
        // set configuration for EggView
        eggViews.enumerated().forEach { index, view in
            let egg = timerBrain.eggs[index]
            view.configure(text: egg.harness, imageName: egg.image)
            
            view.eggButton.addTarget(self, action: #selector(didPressed), for: .touchUpInside)
        }
        
        eggViews.forEach {
            containerStackView.addArrangedSubview($0)
        }
        
        // add view in mainStackView
        [titleLable, containerStackView, boxForProgressView].forEach {
            mainStackView.addArrangedSubview($0)
        }

    }
    
    func setConstraints() {
        
        let boxView = progressView.superview!
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            containerStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -offset),
            containerStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: offset),
        
            progressView.leftAnchor.constraint(equalTo: boxView.leftAnchor, constant: 20),
            progressView.rightAnchor.constraint(equalTo: boxView.rightAnchor, constant: -20),
            progressView.heightAnchor.constraint(equalToConstant: 10),
            progressView.centerYAnchor.constraint(equalTo: boxView.centerYAnchor)])
    }
    
    // MARK: - Methods
    
    @objc func didPressed(_ sender: UIButton) {
        
        if let egg = timerBrain.check(currentEgg: sender.currentTitle) {
            
            // start timer and sets cooking time
            if myTimer.timer.isValid {
                // stop timer if timer on
                myTimer.stopTimer()
            } else {
                myTimer.totalTime = egg.cookingTime
                progressView.progress = 0.0
                myTimer.createTimer()
            }
        }
    }
    
    // MARK: - MyTimerDelegate
    
    func timer() {
        progressView.progress = myTimer.progress
        if progressView.progress == 1.0 {
            playSound()
        }
    }
    
    // MARK: - Sound
    
    func playSound() {
        let sound = (name: "alarm_sound", type: "mp3")
        guard let path = Bundle.main.path(forResource: sound.name, ofType: sound.type) else { return }
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

