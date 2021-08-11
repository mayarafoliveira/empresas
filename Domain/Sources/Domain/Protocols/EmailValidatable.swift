//
//  EmailValidatable.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 05/08/21.
//

import Foundation

protocol EmailValidatable {
    func validate(email: String) -> EmailValidatorError
}
