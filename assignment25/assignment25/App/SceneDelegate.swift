//
//  SceneDelegate.swift
//  assignment25
//
//  Created by Nuca on 11.05.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.rootViewController = initializeRootViewController()
        window?.makeKeyAndVisible()
    }
    
    func initializeRootViewController() -> MainViewController {
        let song = Song(
            title: "Never Gonna Give You Up",
            artist: "Rick Astley",
            length: 300,
            playedTime: 0,
            cover: "Never Gonna Give You Up"
        )
        let mainViewModel = MainViewModel(song: song)
        let mainView = MainView(delegate: mainViewModel)
        return MainViewController(mainViewModel: mainViewModel, mainView: mainView)
    }
}
