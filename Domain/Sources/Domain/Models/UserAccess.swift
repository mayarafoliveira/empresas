//
//  UserAccess.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 16/07/21.
//

import Foundation

public struct UserAccess: Codable {
    public var uid: String?
    public var client: String?
    public var accessToken: String?
    
    public init(uid: String? = nil, client: String? = nil, accessToken: String? = nil) {
        self.uid = uid
        self.client = client
        self.accessToken = accessToken
    }
}
