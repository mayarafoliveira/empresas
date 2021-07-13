//
//  SearchViewController.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 13/07/21.
//

import UIKit

class SearchViewController: UIViewController, EnterpriseDetailProtocol {
    
    private var enterprise: Enterprise?
  
    override func viewDidLoad() {
        super.viewDidLoad()
    
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
        self.enterprise = enterprise
        performSegue(withIdentifier: "EnterpriseDetailView", sender: enterprise)

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EnterpriseDetailView" {
            
            let destinationController = segue.destination as? EnterpriseDetailViewController
            let viewController = destinationController?.view as? EnterpriseDetailView
            
            // Enterprise name
            guard let name = self.enterprise?.enterprise_name else { return }
            viewController?.enterpriseName.text = name
            
            // Background image
            let host = "https://empresas.ioasys.com.br"
            guard let photo = self.enterprise?.photo else { return }
            guard let url = URL(string: host + photo) else { return }
            viewController?.backgroundImage.load(url: url)
            
            // Enterprise description
            guard let description = self.enterprise?.description else { return }
            viewController?.enterpriseDescription.text = description
        }
    }
}
