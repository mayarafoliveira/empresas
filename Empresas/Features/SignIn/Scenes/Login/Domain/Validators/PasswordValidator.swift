//
//  PasswordValidator.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 05/08/21.
//

import Foundation

struct PasswordValidator: PasswordValidatable {
    func validate(password: String) -> PasswordValidatorError {
        let isValid = password.count >= 8
        return isValid ? .valid : .invalid
    }
}
