//
//  LoginPresenter.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 20/07/21.
//

import UIKit

class LoginPresenter: LoginPresenting {
    weak var view: LoginViewable?
    private let loginUseCase: LoginUseCase
    private let coordinator: LoginCoordinating
    
    init(coordinator: LoginCoordinating, loginUseCase: LoginUseCase) {
        self.coordinator = coordinator
        self.loginUseCase = loginUseCase
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
        loginUseCase.login(email: email, password: password) { [weak self] success, error  in
            
            if success {
                self?.coordinator.showSearch()
              
            } else {
                self?.view?.isEmailValid(false)
                self?.view?.isPasswordValid(false)
                
                guard let error = error else { return }
                self?.view?.showError(error: error)
            }
        }
    }
}
