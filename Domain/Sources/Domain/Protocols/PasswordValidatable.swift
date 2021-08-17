//
//  PasswordValidatable.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 05/08/21.
//

import Foundation

public protocol PasswordValidatable {
    func validate(password: String) -> PasswordValidatorError
}
