//
//  User.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 04/08/21.
//

import Foundation

struct User: Decodable {
    var investor: Investor
    var enterprise: String?
    var success: Bool
}
