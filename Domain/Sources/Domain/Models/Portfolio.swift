//
//  Portfolio.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 04/08/21.
//

import Foundation

public struct Portfolio: Decodable {
    public var enterprisesNumber: Int
    public var enterprises: [String]
}

extension Portfolio {
    public enum CodingKeys: String, CodingKey {
        case enterprisesNumber = "enterprises_number"
        case enterprises
    }
}
