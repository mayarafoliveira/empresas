//
//  PasswordValidatable.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 05/08/21.
//

import Foundation

protocol PasswordValidatable {
    func validate(password: String) -> PasswordValidatorError
}
