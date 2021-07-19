//
//  EnterpriseDetailViewController.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 13/07/21.
//

import UIKit

class EnterpriseDetailViewController: UIViewController {
    
    private var enterprise: Enterprise?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        view = EnterpriseDetailView(enterprise: self.enterprise)
    }

    init(enterprise: Enterprise) {
        super.init(nibName: nil, bundle: nil)
        self.enterprise = enterprise
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
