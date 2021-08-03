//
//  EnterpriseDetailPresenter.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 20/07/21.
//

import UIKit

protocol EnterpriseDetailPresenting: AnyObject {
    func attach(view: EnterpriseDetailViewable)
    var enterprise: Enterprise { get }
}

protocol EnterpriseDetailViewable: AnyObject {
    
}

class EnterpriseDetailPresenter: EnterpriseDetailPresenting {
    var enterprise: Enterprise
    weak var view: EnterpriseDetailViewable?
    private let networking: Networking
    private let appStorage: AppStorage
    private let coordinator: EnterpriseDetailCoordinating
    
    init(coordinator: EnterpriseDetailCoordinating, networking: Networking, appStorage: AppStorage, enterprise: Enterprise) {
        self.coordinator = coordinator
        self.networking = networking
        self.appStorage = appStorage
        self.enterprise = enterprise
    }
    
    func attach(view: EnterpriseDetailViewable) {
        self.view = view
    }
}
