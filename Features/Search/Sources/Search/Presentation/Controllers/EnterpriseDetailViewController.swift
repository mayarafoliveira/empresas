//
//  EnterpriseDetailViewController.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 13/07/21.
//

import UIKit
import EmpresasUI

public class EnterpriseDetailViewController: BaseViewController {
    
    private let presenter: EnterpriseDetailPresenting
    private lazy var enterpriseDetailView = EnterpriseDetailView(enterprise: presenter.enterprise)
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomNavigation()
    }
    
    open override func loadView() {
        enterpriseDetailView.delegate = self
        view = enterpriseDetailView
    }

    public init(presenter: EnterpriseDetailPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        presenter.attach(view: self)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EnterpriseDetailViewController: EnterpriseDetailViewable {
    
}

extension EnterpriseDetailViewController: EnterpriseDetailDelegate {
    
}
