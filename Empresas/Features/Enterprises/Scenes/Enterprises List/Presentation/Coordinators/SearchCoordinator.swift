//
//  SearchCoordinator.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 29/07/21.
//

import UIKit

struct SearchCoordinator: Coordinator, SearchCoordinating {
    
    private weak var rootViewController: UINavigationController?
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    func start() {
        guard let rootViewController = rootViewController else { return }
        
        let presenter = SearchPresenter(
            coordinator: self,
            networking: Networking(),
            appStorage: .shared
        )
        
        rootViewController.setViewControllers([SearchViewController(presenter: presenter)], animated: true
        )
    }
    
    func showEnterpriseDetail(_ enterprise: Enterprise) {
        guard let rootViewController = rootViewController else { return }
        
        EnterpriseDetailCoordinator(rootViewController: rootViewController, enterprise: enterprise).start()
    }
}
