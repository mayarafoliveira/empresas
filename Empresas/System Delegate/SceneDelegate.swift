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
        let nav = UINavigationController()
        let presenter = LoginPresenter(navigationController: nav, networking: Networking(), appStorage: .shared)
        let loginViewController = LoginViewController(presenter: presenter)
        nav.setViewControllers([loginViewController], animated: false)
        window?.rootViewController = nav
    }
    
    func showSearch() {
        let searchViewController = UINavigationController(rootViewController: SearchViewController())
        searchViewController.modalPresentationStyle = .fullScreen
        window?.rootViewController = searchViewController
    }
}
