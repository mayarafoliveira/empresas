//
//  LoginCoordinator.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 27/07/21.
//

import UIKit
import Domain
import Common
import App

public struct LoginCoordinator: Coordinator, LoginCoordinating {
    
    private weak var rootViewController: UINavigationController?
    
    public init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    public func start() {
        guard let rootViewController = rootViewController else { return }
        
        let presenter = LoginPresenter(
            coordinator: self,
            loginUseCase: DIContainer.shared.resolve(),
            emailValidator: DIContainer.shared.resolve(),
            passwordValidator: DIContainer.shared.resolve()
        )
        
        rootViewController.setViewControllers(
            [LoginViewController(presenter: presenter)],
            animated: true
        )
    }
    
    public func showSearch() {
        let window = rootViewController?.view.window
        let appSceneDelegate = window?.windowScene?.delegate as? AppSceneDelegate
        appSceneDelegate?.showSearch()
    }
}
