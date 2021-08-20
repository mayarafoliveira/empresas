//
//  LoginUseCase.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 04/08/21.
//

import Foundation

public protocol LoginUseCase {
    func login(email: String, password: String, completion: @escaping (Bool, Error?) -> Void)
}
