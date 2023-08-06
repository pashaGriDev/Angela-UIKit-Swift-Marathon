//
//  SceneDelegate.swift
//  Destuni-Angela-Homework
//
//  Created by Павел Грицков on 29.01.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = StartViewController()
        window?.makeKeyAndVisible()
    }
}

