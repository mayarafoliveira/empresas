//
//  SceneDelegate.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 12/07/21.
//

import UIKit
import Domain
import App
import Common
import Signing
import Search
import Networking

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        dependenciesInject()
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        guard let window = window else { return }
        self.appCoordinator = AppCoordinator(window: window, delegate: self)
        self.appCoordinator?.start()
        
        window.makeKeyAndVisible()
    }
    
    func dependenciesInject() {
        DIContainer.shared.register(
            type: LoginUseCase.self,
            component: RemoteLoginUseCase(resource: .shared)
        )
        
        DIContainer.shared.register(
            type: SearchUseCase.self,
            component: RemoteSearchUseCase(resource: .shared)
        )
        
        DIContainer.shared.register(
            type: EmailValidatable.self,
            component: EmailValidator()
        )
        
        DIContainer.shared.register(
            type: PasswordValidatable.self,
            component: PasswordValidator()
        )
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

extension SceneDelegate: AppCoordinatorDelegate {
    
    func showLogin(rootViewController: UINavigationController) {
        let loginCoordinator = LoginCoordinator(rootViewController: rootViewController)
        loginCoordinator.start()
    }
    
    func showSearch(rootViewController: UINavigationController) {
        let searchCoordinator = SearchCoordinator(rootViewController: rootViewController)
        searchCoordinator.start()
    }
}
