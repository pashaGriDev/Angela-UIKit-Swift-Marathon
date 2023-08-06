//
//  WelcomViewController.swift
//  FlashChat-IOS13-Angela
//
//  Created by Павел Грицков on 14.03.23.
//

import UIKit

class WelcomViewController: UIViewController {
    
    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet var authButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoLabel.text = K.appName
        appearanceAuthButton()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // уточнить почему не вызывается этот метод
        print("awakeFromNib")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: K.BrandColors.blue)
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationController?.navigationBar.tintColor = .white
//        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.isHidden = true
//        navigationController?.navigationBar.backgroundColor = UIColor(named: K.BrandColors.blue)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    @IBAction func moveButtonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            let registerViewController = RegisterViewController()
            navigationController?.pushViewController(registerViewController, animated: true)
        case 1:
            let loginViewController = LoginViewController()
            navigationController?.pushViewController(loginViewController, animated: true)
        default:
            break
        }
    }
}

extension WelcomViewController {
    /// устанавливает радиус и устанавливает таг равный индексу в массиве
    func appearanceAuthButton() {
        let buttonHeigth = authButtons.first?.frame.height ?? 0
        let radius = buttonHeigth / 2
        authButtons.enumerated().forEach { (index, button) in
            button.layer.cornerRadius = radius
            button.tag = index
        }
    }
}
