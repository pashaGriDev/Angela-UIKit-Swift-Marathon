//
//  SceneDelegate.swift
//  Clima-Angela
//
//  Created by Павел Грицков on 17.02.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = WeatherController()
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
    }
    
///    Для приложения, которое находится в фоновом режиме, UIKit переводит ваше приложение в неактивное состояние, вызывая следующий метод (если использовать сцены)
///    При переходе из фонового режима в активный используйте эти методы для загрузки ресурсов с диска и получения данных из сети
    func sceneWillEnterForeground(_ scene: UIScene) {
        print("Hello - sceneWillEnterForeground")
    }
    
//    Во время деактивации UIKit вызывает один из следующий метод (если использовать сцены)
    func sceneWillResignActive(_ scene: UIScene) {
        print("Hello - sceneWillResignActive")
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        print("Hello - sceneDidBecomeActive")
    }
}


