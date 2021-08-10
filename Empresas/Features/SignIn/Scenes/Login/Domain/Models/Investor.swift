//
//  Investor.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 04/08/21.
//

import Foundation

struct Investor: Decodable {
    var id: Int
    var investorName: String
    var email: String
    var city: String
    var country: String
    var balance: Double
    var photo: String?
    var portfolio: Portfolio
    
    var portfolioValue: Double
    var firstAccess: Bool
    var superAngel: Bool
}

extension Investor {
    enum CodingKeys: String, CodingKey {
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
