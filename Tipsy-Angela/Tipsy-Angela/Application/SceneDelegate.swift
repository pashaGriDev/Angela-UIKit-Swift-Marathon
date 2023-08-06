//
//  SceneDelegate.swift
//  Tipsy-Angela
//
//  Created by Павел Грицков on 15.02.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = CalculatorController()
//        window?.rootViewController = ResultController()
        window?.backgroundColor = .white
        // Всегда показывает светлую тему
        window?.overrideUserInterfaceStyle = .light
        window?.makeKeyAndVisible()
    }
}

