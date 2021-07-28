//
//  LoginCoordinator.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 27/07/21.
//

import UIKit

struct LoginCoordinator: Coordinator, LoginCoordinating {
    
    private weak var rootViewController: UINavigationController?
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    func start() {
        guard let rootViewController = rootViewController else { return }
        let presenter = LoginPresenter(coordinator: self,
                                       navigationController: rootViewController,
                                       networking: Networking(),
                                       appStorage: .shared)
        
        rootViewController.setViewControllers(
            [LoginViewController(presenter: presenter)],
            animated: true
        )
    }
}
