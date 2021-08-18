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
//import Networking

public struct LoginCoordinator: Coordinator, LoginCoordinating {
    
    private weak var rootViewController: UINavigationController?
    
    public init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    public func start() {
        guard let rootViewController = rootViewController else { return }
        
        let presenter = LoginPresenter(
            coordinator: self,
            loginUseCase: RemoteLoginUseCase(resource: .shared), emailValidator: EmailValidator(), passwordValidator: PasswordValidator()
        )
        
        rootViewController.setViewControllers(
            [LoginViewController(presenter: presenter)],
            animated: true
        )
    }
    
    public func showSearch() {
//        let window = rootViewController?.view.window
//        let sceneDelegate = window?.windowScene?.delegate as? SceneDelegate
//        sceneDelegate?.showSearch()
        let navigation = UINavigationController()
        let window = rootViewController?.view.window
        let sceneDelegate = window?.windowScene?.delegate as? AppCoordinatorDelegate
        sceneDelegate?.showSearch(rootViewController: navigation)
    }
}
