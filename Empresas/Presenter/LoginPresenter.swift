//
//  LoginPresenter.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 20/07/21.
//

import UIKit

protocol LoginPresenting: AnyObject {
    func signIn(email: String, password: String)
    func attach(view: LoginViewable)
    func validateEmail(email: String)
    func validatePassword(password: String)
}

protocol LoginViewable: AnyObject {
    func showError(error: Error)
    func isEmailValid(_ isValid: Bool)
    func isPasswordValid(_ isValid: Bool)
}

class LoginPresenter: LoginPresenting {
    weak var view: LoginViewable?
    weak var navigationController: UINavigationController?
    private let networking: Networking
    private let appStorage: AppStorage
    
    init(navigationController: UINavigationController, networking: Networking, appStorage: AppStorage) {
        self.navigationController = navigationController
        self.networking = networking
        self.appStorage = appStorage
    }
    
    func attach(view: LoginViewable) {
        self.view = view
    }
    
    func validateEmail(email: String) {
        let isValid = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: email)
        view?.isEmailValid(isValid)
    }
    
    func validatePassword(password: String) {
        let isValid = password.count >= 8
        view?.isPasswordValid(isValid)
    }
    
    func signIn(email: String, password: String) {
        
        let values = Login(email: email, password: password)
  
        networking.login(order: values) { [weak self] success, error  in
      
            if success {
                let window = self?.navigationController?.view.window
                let sceneDelegate = window?.windowScene?.delegate as? SceneDelegate
                sceneDelegate?.showSearch()
              
            } else {
                guard let error = error else { return }
                self?.view?.showError(error: error)
                self?.view?.isEmailValid(false)
                self?.view?.isPasswordValid(false)
            }
        }
    }
    
}