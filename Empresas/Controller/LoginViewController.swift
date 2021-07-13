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

        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let searchViewController = storyBoard
                .instantiateViewController(withIdentifier: "SearchViewController")
                as? SearchViewController else { return }
        searchViewController.modalPresentationStyle = .fullScreen
        
        self.present(searchViewController, animated: true, completion: nil)
    }
}
