//
//  EmailValidator.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 05/08/21.
//

import Foundation

struct EmailValidator: EmailValidatable {
    func validate(email: String) -> EmailValidatorError {
        let isValid = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: email)
        return isValid ? .valid : .invalid
    }
}
