//
//  SceneDelegate.swift
//  assignment24
//
//  Created by Nuca on 08.05.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let firstViewController = MainPageViewController()
        let navigationController = UINavigationController(rootViewController: firstViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}

