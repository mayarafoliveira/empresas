//
//  Investor.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 04/08/21.
//

import Foundation

public struct Investor: Decodable {
    public var id: Int
    public var investorName: String
    public var email: String
    public var city: String
    public var country: String
    public var balance: Double
    public var photo: String?
    public var portfolio: Portfolio
    
    public var portfolioValue: Double
    public var firstAccess: Bool
    public var superAngel: Bool
}

extension Investor {
    public enum CodingKeys: String, CodingKey {
        case id
        case investorName = "investor_name"
        case email
        case city
        case country
        case balance
        case photo
        case portfolio
        
        case portfolioValue = "portfolio_value"
        case firstAccess = "first_access"
        case superAngel = "super_angel"
    }
}
