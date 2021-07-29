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
}

extension SceneDelegate {
    
    func showLogin() {
        let rootViewController = UINavigationController()
        
        LoginCoordinator(rootViewController: rootViewController).start()
        window?.rootViewController = rootViewController
    }
    
    func showSearch() {
        let navigation = UINavigationController()
        let presenter = SearchPresenter(navigationController: navigation, networking: Networking(), appStorage: .shared)
        let searchViewController = SearchViewController(presenter: presenter)
        navigation.setViewControllers([searchViewController], animated: true)
        window?.rootViewController = navigation
    }
    
    // método só para testar o coordinator do Enterprise Detail
    func showEnterpriseDetail(enterprise: Enterprise) {
        let rootViewController = UINavigationController()
        
        EnterpriseDetailCoordinator(rootViewController: rootViewController, enterprise: enterprise).start()
        window?.rootViewController = rootViewController
    }
}
