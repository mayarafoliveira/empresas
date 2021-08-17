//
//  User.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 04/08/21.
//

import Foundation

public struct User: Decodable {
    public var investor: Investor
    public var enterprise: String?
    public var success: Bool
}
