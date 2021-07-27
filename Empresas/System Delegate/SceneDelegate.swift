//
//  SceneDelegate.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 12/07/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        
        if AppStorage.shared.authorization?.accessToken == nil {
            showLogin()
        } else {
            showSearch()
        }
    }

    func showLogin() {
        let navigation = UINavigationController()
        let presenter = LoginPresenter(navigationController: navigation, networking: Networking(), appStorage: .shared)
        let loginViewController = LoginViewController(presenter: presenter)
        navigation.setViewControllers([loginViewController], animated: false)
        window?.rootViewController = navigation
    }
    
    func showSearch() {
        let navigation = UINavigationController()
        let presenter = SearchPresenter(navigationController: navigation, networking: Networking(), appStorage: .shared)
        let searchViewController = SearchViewController(presenter: presenter)
        navigation.setViewControllers([searchViewController], animated: true)
        window?.rootViewController = navigation
    }
}
