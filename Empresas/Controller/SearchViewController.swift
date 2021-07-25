//
//  SearchViewController.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 13/07/21.
//

import UIKit

class SearchViewController: BaseViewController, EnterpriseDetailProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomNavigation()
    }
    
    override func loadView() {
        let searchView = SearchView()
        searchView.delegate = self
        view = searchView
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return.lightContent
    }
    
    func showEnterpriseDetail(_ enterprise: Enterprise) {
        self.navigationController?.pushViewController(EnterpriseDetailViewController(enterprise: enterprise), animated: true)
    }

}
