//
//  EnterpriseDetailViewController.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 13/07/21.
//

import UIKit

class EnterpriseDetailViewController: BaseViewController, CustomTellerBack {
    
    private var enterprise: Enterprise?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomNavigation()
    }
    
    override func loadView() {
        let enterpriseView = EnterpriseDetailView(enterprise: self.enterprise)
        enterpriseView.delegate = self
        view = enterpriseView
    }

    init(enterprise: Enterprise) {
        super.init(nibName: nil, bundle: nil)
        self.enterprise = enterprise
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
