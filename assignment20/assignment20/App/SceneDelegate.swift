//
//  SceneDelegate.swift
//  assignment20
//
//  Created by nuca on 22.04.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let firstViewController = CountriesViewController()
        let navigationController = UINavigationController(rootViewController: firstViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}

