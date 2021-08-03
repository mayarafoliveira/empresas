//
//  SceneDelegate.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 12/07/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        guard let window = window else { return }
        self.appCoordinator = AppCoordinator(window: window)
        self.appCoordinator?.start()
        
        window.makeKeyAndVisible()
    }
}

extension SceneDelegate {
    
    func showLogin() {
        appCoordinator?.showLogin()
    }
    
    func showSearch() {
        appCoordinator?.showSearch()
    }
}
