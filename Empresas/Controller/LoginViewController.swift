//
//  LoginViewController.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 13/07/21.
//

import UIKit

class LoginViewController: UIViewController, CustomTeller {
    
    private lazy var networking = Networking()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        let loginView = LoginView()
        loginView.delegate = self
        view = loginView
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return.lightContent
    }
    
    func signInButtonClicked(_: UIButton) {
        
        let search = UINavigationController(rootViewController: SearchViewController())
        search.modalPresentationStyle = .fullScreen
        self.present(search, animated: true, completion: nil)

    }
}
