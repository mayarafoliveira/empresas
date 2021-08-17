//
//  SearchViewController.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 13/07/21.
//

import UIKit

open class SearchViewController: BaseViewController {
    
    private let presenter: SearchPresenting
    private lazy var searchView = SearchView()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomNavigation()
    }
    
    init(presenter: SearchPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        presenter.attach(view: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func loadView() {
        searchView.delegate = self
        view = searchView
    }
}

extension SearchViewController: SearchViewable {    
    func updateList(_ enterprises: [Enterprise]) {
        searchView.updateList(enterprises)
    }
}

extension SearchViewController: SearchViewDelegate {
    func searchFor(enterprise: String) {
        self.presenter.searchFor(enterprise)
    }
    
    func showEnterpriseDetail(_ enterprise: Enterprise) {
        self.presenter.showEnterpriseDetail(enterprise)
    }
}
