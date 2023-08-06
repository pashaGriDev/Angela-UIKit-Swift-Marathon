//
//  ViewController.swift
//  I Am Poor
//
//  Created by Павел Грицков on 16.01.23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var coalImageView: UIImageView!
    
    @IBOutlet weak var hiddeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCoal()
    }
    
    private func configureCoal() {
        coalImageView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleShowLabel))
        coalImageView.addGestureRecognizer(gesture)
    }
    
    @objc func handleShowLabel() {
        hiddeLabel.alpha = 0.0
        self.hiddeLabel.isHidden = false
        UIView.animate(withDuration: 2.0, delay: 0.0) {
            self.hiddeLabel.alpha = 1.0
        }
    }


}

