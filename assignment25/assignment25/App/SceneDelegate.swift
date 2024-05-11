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
        let mainView = MainView()
        let song = Song(
            title: "",
            artist: "",
            length: 300, 
            playedTime: 0,
            cover: ""
        )
        let mainViewModel = MainViewModel(song: song)
        return MainViewController(mainViewModel: mainViewModel, mainView: mainView)
    }
}
