//
//  LoginPresenter.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 20/07/21.
//

import UIKit

protocol LoginPresenting: AnyObject {
    func showPassword(sender: UIButton, textField: UITextField)
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
        // fazer verificação
        view?.isEmailValid(true)
    }
    
    func validatePassword(password: String) {
        // fazer verificação
        view?.isPasswordValid(true)
    }
    
    func showPassword(sender: UIButton, textField: UITextField) {
        switch sender.backgroundColor {
        case UIColor.clear:
            sender.backgroundColor = .pinkMain
            textField.isSecureTextEntry = false
        default:
            sender.backgroundColor = .clear
            textField.isSecureTextEntry = true
        }
    }
    
    func signIn(email: String, password: String) {
        
        let values = Login(email: email, password: password)
  
        networking.login(order: values) { [weak self] success, error  in
      
            if success {
                let window = self?.navigationController?.view.window
                let sceneDelegate = window?.windowScene?.delegate as? SceneDelegate
                sceneDelegate?.showSearch()
              
            } else {
                if let error = error { print(error.localizedDescription) }
                self?.view?.isEmailValid(false)
                self?.view?.isPasswordValid(false)
            }
        }
    }
    
}
