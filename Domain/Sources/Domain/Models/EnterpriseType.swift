//
//  EnterpriseType.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 03/08/21.
//

import Foundation

public struct EnterpriseType: Decodable {
    public var id: Int
    public var enterpriseTypeName: String
}

extension EnterpriseType {
    public enum CodingKeys: String, CodingKey {
        case id
        case enterpriseTypeName = "enterprise_type_name"
    }
}
