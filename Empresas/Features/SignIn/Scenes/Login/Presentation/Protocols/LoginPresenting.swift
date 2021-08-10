//
//  LoginPresenting.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 04/08/21.
//

import Foundation

protocol LoginPresenting: AnyObject {
    func signIn(email: String, password: String)
    func attach(view: LoginViewable)
    func validateEmail(email: String)
    func validatePassword(password: String)
}
