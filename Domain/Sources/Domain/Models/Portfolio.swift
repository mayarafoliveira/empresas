//
//  Portfolio.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 04/08/21.
//

import Foundation

struct Portfolio: Decodable {
    var enterprisesNumber: Int
    var enterprises: [String]
}

extension Portfolio {
    enum CodingKeys: String, CodingKey {
        case enterprisesNumber = "enterprises_number"
        case enterprises
    }
}
