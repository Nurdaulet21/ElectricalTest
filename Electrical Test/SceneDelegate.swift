//
//  SceneDelegate.swift
//  Electrical Test
//
//  Created by Нурдаулет on 26.05.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController = MainViewController()
        self.window?.makeKeyAndVisible()
    }

}

