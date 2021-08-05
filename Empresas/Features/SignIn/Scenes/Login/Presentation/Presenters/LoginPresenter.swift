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
    private let emailValidator: EmailValidatable
    private let passwordValidator: PasswordValidatable
    
    init(coordinator: LoginCoordinating,
         loginUseCase: LoginUseCase,
         emailValidator: EmailValidatable,
         passwordValidator: PasswordValidatable) {
        
        self.coordinator = coordinator
        self.loginUseCase = loginUseCase
        self.emailValidator = emailValidator
        self.passwordValidator = passwordValidator
    }
    
    func attach(view: LoginViewable) {
        self.view = view
    }
    
    func validateEmail(email: String) {
        switch emailValidator.validate(email: email) {
        case .valid:
            view?.isEmailValid(true)
        case .invalid:
            view?.isEmailValid(false)
        }
    }
    
    func validatePassword(password: String) {
        switch passwordValidator.validate(password: password) {
        case .valid:
            view?.isPasswordValid(true)
        case .invalid:
            view?.isPasswordValid(false)
        }
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
