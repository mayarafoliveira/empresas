//
//  LoginViewController.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 13/07/21.
//

import UIKit
import EmpresasUI

public class LoginViewController: BaseViewController {
    
    private let presenter: LoginPresenting
    private lazy var loginView = LoginView()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomNavigation()
    }
    
    public init(presenter: LoginPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        presenter.attach(view: self)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        loginView.delegate = self
        view = loginView
    }
    
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return.lightContent
    }
}

extension LoginViewController: LoginViewable {
    public func isEmailValid(_ isValid: Bool) {
        loginView.isEmailValid(isValid)
    }
    
    public func isPasswordValid(_ isValid: Bool) {
        loginView.isPasswordValid(isValid)
    }
    
    public func showError(error: Error) {
        let alert = UIAlertController(title: "Oops", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Tentar novamente", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension LoginViewController: LoginViewDelegate {
    public func validateEmail(email: String) {
        presenter.validateEmail(email: email)
    }
    
    public func validatePassword(password: String) {
        presenter.validatePassword(password: password)
    }
    
    public func signIn(email: String, password: String) {
        self.presenter.signIn(email: email, password: password)
    }
}
