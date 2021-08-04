//
//  EnterpriseType.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 03/08/21.
//

import Foundation

struct EnterpriseType: Decodable {
    var id: Int
    var enterpriseTypeName: String
}

extension EnterpriseType {
    enum CodingKeys: String, CodingKey {
        case id
        case enterpriseTypeName = "enterprise_type_name"
    }
}
