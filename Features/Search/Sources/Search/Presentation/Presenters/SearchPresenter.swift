//
//  SearchPresenter.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 20/07/21.
//

import UIKit

class SearchPresenter: SearchPresenting {
    weak var view: SearchViewable?
    private let searchUseCase: SearchUseCase
    private let coordinator: SearchCoordinating
    
    init(coordinator: SearchCoordinating, searchUseCase: SearchUseCase) {
        self.coordinator = coordinator
        self.searchUseCase = searchUseCase
    }
    
    func attach(view: SearchViewable) {
        self.view = view
    }
    
    func searchFor(_ enterprise: String) {
        searchUseCase.searchEnterprise(text: Search(enterpriseSearched: enterprise)) { (enterprises, error) in

            if let error = error { print(error) }
            guard let enterprises = enterprises?.enterprises else { return }
            self.view?.updateList(enterprises)
        }
    }
    
    func showEnterpriseDetail(_ enterprise: Enterprise) {
        coordinator.showEnterpriseDetail(enterprise)
    }

}
