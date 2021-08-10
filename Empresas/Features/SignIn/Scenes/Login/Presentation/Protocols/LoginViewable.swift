//
//  LoginViewable.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 04/08/21.
//

import Foundation

protocol LoginViewable: AnyObject {
    func showError(error: Error)
    func isEmailValid(_ isValid: Bool)
    func isPasswordValid(_ isValid: Bool)
}
