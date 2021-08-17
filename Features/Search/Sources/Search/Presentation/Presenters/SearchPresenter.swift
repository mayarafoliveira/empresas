//
//  SearchPresenter.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 20/07/21.
//

import UIKit
import Domain

public class SearchPresenter: SearchPresenting {
    weak var view: SearchViewable?
    private let searchUseCase: SearchUseCase
    private let coordinator: SearchCoordinating
    
    public init(coordinator: SearchCoordinating, searchUseCase: SearchUseCase) {
        self.coordinator = coordinator
        self.searchUseCase = searchUseCase
    }
    
    public func attach(view: SearchViewable) {
        self.view = view
    }
    
    public func searchFor(_ enterprise: String) {
        searchUseCase.searchEnterprise(text: Search(enterpriseSearched: enterprise)) { (enterprises, error) in

            if let error = error { print(error) }
            guard let enterprises = enterprises?.enterprises else { return }
            self.view?.updateList(enterprises)
        }
    }
    
    public func showEnterpriseDetail(_ enterprise: Enterprise) {
        coordinator.showEnterpriseDetail(enterprise)
    }

}
