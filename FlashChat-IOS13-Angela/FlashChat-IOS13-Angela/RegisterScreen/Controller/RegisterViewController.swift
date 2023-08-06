//
//  RegisterViewController.swift
//  FlashChat-IOS13-Angela
//
//  Created by Павел Грицков on 14.03.23.
//

import UIKit
//import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: изменить цвет кнопки назад в навигатор контроллере
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: K.BrandColors.lighBlue)
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationController?.navigationBar.tintColor = UIColor(named: K.BrandColors.blue)
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {

        if let email = emailTextField.text,
           let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error {
                    // выдает ошибку на языке устройства
                    // можно потом сделать алерт
                    print(error.localizedDescription)
                } else {
                    let chatViewController = ChatViewController()
                    self.navigationController?.pushViewController(chatViewController, animated: true)
                }
            }
        }
    }
}
