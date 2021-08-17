//
//  AppCoordinator.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 30/07/21.
//

import UIKit
import Common

public struct AppCoordinator: Coordinator, AppCoordinating {
    
    private var window: UIWindow?
    private weak var delegate: AppCoordinatorDelegate?
    
    public init(window: UIWindow, delegate: AppCoordinatorDelegate) {
        self.window = window
        self.delegate = delegate
    }
    
    public func start() {
        if AppStorage.shared.authorization?.accessToken == nil {
            showLogin()
        } else {
            showSearch()
        }
    }
    
    public func showLogin() {
        let rootViewController = UINavigationController()
        delegate?.showLogin(rootViewController: rootViewController)
        window?.rootViewController = rootViewController
    }
    
    public func showSearch() {
        let rootViewController = UINavigationController()
        delegate?.showSearch(rootViewController: rootViewController)
        window?.rootViewController = rootViewController
    }
    
}
