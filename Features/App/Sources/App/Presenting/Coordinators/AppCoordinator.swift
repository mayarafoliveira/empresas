//
//  AppCoordinator.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 30/07/21.
//

import UIKit

struct AppCoordinator: Coordinator, AppCoordinating {
    
    private var window: UIWindow?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        if AppStorage.shared.authorization?.accessToken == nil {
            showLogin()
        } else {
            showSearch()
        }
    }
    
    func showLogin() {
        let rootViewController = UINavigationController()
        LoginCoordinator(rootViewController: rootViewController).start()
        window?.rootViewController = rootViewController
    }
    
    func showSearch() {
        let rootViewController = UINavigationController()
        SearchCoordinator(rootViewController: rootViewController).start()
        window?.rootViewController = rootViewController
    }
    
}
