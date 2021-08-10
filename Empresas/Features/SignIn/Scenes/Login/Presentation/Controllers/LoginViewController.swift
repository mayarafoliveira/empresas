//
//  LoginViewController.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 13/07/21.
//

import UIKit

class LoginViewController: BaseViewController {
    
    private let presenter: LoginPresenting
    private lazy var loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomNavigation()
    }
    
    init(presenter: LoginPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        presenter.attach(view: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        loginView.delegate = self
        view = loginView
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return.lightContent
    }
}

extension LoginViewController: LoginViewable {
    func isEmailValid(_ isValid: Bool) {
        loginView.isEmailValid(isValid)
    }
    
    func isPasswordValid(_ isValid: Bool) {
        loginView.isPasswordValid(isValid)
    }
    
    func showError(error: Error) {
        let alert = UIAlertController(title: "Oops", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Tentar novamente", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension LoginViewController: LoginViewDelegate {
    func validateEmail(email: String) {
        presenter.validateEmail(email: email)
    }
    
    func validatePassword(password: String) {
        presenter.validatePassword(password: password)
    }
    
    func signIn(email: String, password: String) {
        self.presenter.signIn(email: email, password: password)
    }
}
