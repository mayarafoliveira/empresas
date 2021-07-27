//
//  EnterpriseDetailPresenter.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 20/07/21.
//

import UIKit

protocol EnterpriseDetailPresenting: AnyObject {
    func attach(view: EnterpriseDetailViewable)
}

protocol EnterpriseDetailViewable: AnyObject {
    
}

class EnterpriseDetailPresenter: EnterpriseDetailPresenting {
    weak var view: EnterpriseDetailViewable?
    weak var navigationController: UINavigationController?
    private let networking: Networking
    private let appStorage: AppStorage
    
    init(navigationController: UINavigationController, networking: Networking, appStorage: AppStorage) {
        self.navigationController = navigationController
        self.networking = networking
        self.appStorage = appStorage
    }
    
    func attach(view: EnterpriseDetailViewable) {
        self.view = view
    }
}
