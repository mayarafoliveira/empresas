//
//  SearchPresenter.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 20/07/21.
//

import UIKit

protocol SearchPresenting: AnyObject {
    func searchFor(_ enterprise: String)
    func attach(view: SearchViewable)
    func showEnterpriseDetail(_ enterprise: Enterprise)
}

protocol SearchViewable: AnyObject {
    func updateList(_ enterprises: [Enterprise])
}

class SearchPresenter: SearchPresenting {
    weak var view: SearchViewable?
    private let networking: Networking
    private let appStorage: AppStorage
    private let coordinator: SearchCoordinating
    
    init(coordinator: SearchCoordinating, networking: Networking, appStorage: AppStorage) {
        self.coordinator = coordinator
        self.networking = networking
        self.appStorage = appStorage
    }
    
    func attach(view: SearchViewable) {
        self.view = view
    }
    
    func searchFor(_ enterprise: String) {
        networking.searchEnterprise(text: Search(enterpriseSearched: enterprise)) { (enterprises, error) in

            if let error = error { print(error) }
            guard let enterprises = enterprises?.enterprises else { return }
            self.view?.updateList(enterprises)
        }
    }
    
    func showEnterpriseDetail(_ enterprise: Enterprise) {
        coordinator.showEnterpriseDetail(enterprise)
    }

}
