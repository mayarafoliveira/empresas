//
//  EnterpriseDetailCoordinator.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 28/07/21.
//

import UIKit
import Domain
import Common

public struct EnterpriseDetailCoordinator: Coordinator, EnterpriseDetailCoordinating {
    
    private weak var rootViewController: UINavigationController?
    private let enterprise: Enterprise
    
    public init(rootViewController: UINavigationController, enterprise: Enterprise) {
        self.rootViewController = rootViewController
        self.enterprise = enterprise
    }
    
    public func start() {
        guard let rootViewController = rootViewController else { return }
        
        let presenter = EnterpriseDetailPresenter(
            coordinator: self,
            enterprise: enterprise
        )
        
        rootViewController.pushViewController(EnterpriseDetailViewController(presenter: presenter), animated: true)
    }
}
