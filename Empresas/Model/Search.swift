//
//  Search.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 13/07/21.
//

import Foundation

struct Search: Decodable {
    var enterpriseSearched: String
}

struct SearchResult: Decodable {
    var enterprises: [Enterprise]
}

struct Enterprise: Decodable {
    var id: Int
    var email_enterprise: String?
    var facebook: String?
    var twitter: String?
    var linkedin: String?
    var phone: String?
    var own_enterprise: Bool
    var enterprise_name: String
    var photo: String
    var description: String
    var city: String
    var country: String
    var value: Int
    var share_price: Double
    var enterprise_type: EnterpriseType
}

struct EnterpriseType: Decodable {
    var id: Int
    var enterprise_type_name: String
}

