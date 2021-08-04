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
        
        let presenter = LoginPresenter(
            coordinator: self,
            loginUseCase: RemoteLoginUseCase(resource: .shared)
        )
        
        rootViewController.setViewControllers(
            [LoginViewController(presenter: presenter)],
            animated: true
        )
    }
    
    func showSearch() {
        let window = rootViewController?.view.window
        let sceneDelegate = window?.windowScene?.delegate as? SceneDelegate
        sceneDelegate?.showSearch()
    }
}
