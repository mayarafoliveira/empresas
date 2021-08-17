//
//  SearchCoordinator.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 29/07/21.
//

import UIKit
import Domain
import Common
//import Networking

public struct SearchCoordinator: Coordinator, SearchCoordinating {
    
    private weak var rootViewController: UINavigationController?
    
    public init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    public func start() {
        guard let rootViewController = rootViewController else { return }
        
        let presenter = SearchPresenter(
            coordinator: self,
            searchUseCase: RemoteSearchUseCase(resource: .shared)
        )
        
        rootViewController.setViewControllers([SearchViewController(presenter: presenter)], animated: true
        )
    }
    
    public func showEnterpriseDetail(_ enterprise: Enterprise) {
        guard let rootViewController = rootViewController else { return }
        
        EnterpriseDetailCoordinator(rootViewController: rootViewController, enterprise: enterprise).start()
    }
}
