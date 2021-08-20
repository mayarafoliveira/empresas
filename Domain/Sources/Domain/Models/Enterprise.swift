//
//  Enterprise.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 03/08/21.
//

import Foundation

public struct Enterprise: Decodable {
    public var id: Int
    public var emailEnterprise: String?
    public var facebook: String?
    public var twitter: String?
    public var linkedin: String?
    public var phone: String?
    public var ownEnterprise: Bool
    public var enterpriseName: String
    public var photo: String
    public var description: String
    public var city: String
    public var country: String
    public var value: Int
    public var sharePrice: Double
    public var enterpriseType: EnterpriseType
}

extension Enterprise {
    public enum CodingKeys: String, CodingKey {
        case id
        case emailEnterprise = "email_enterprise"
        case facebook
        case twitter
        case linkedin
        case phone
        case ownEnterprise = "own_enterprise"
        case enterpriseName = "enterprise_name"
        case photo
        case description
        case city
        case country
        case value
        case sharePrice = "share_price"
        case enterpriseType = "enterprise_type"
    }
}
