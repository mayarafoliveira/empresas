//
//  SearchPresenter.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 20/07/21.
//

import UIKit

protocol SearchPresenterDelegate: AnyObject {
    
}

typealias PresenterDelegateSearch = SearchPresenterDelegate & UIViewController

class SearchPresenter {
    weak var delegate: PresenterDelegateSearch?
    
    init() {
        
    }
    
    func setViewDelegate(delegate: PresenterDelegateSearch) {
        self.delegate = delegate
    }
}
