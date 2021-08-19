//
//  LoginResource.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 04/08/21.
//

import UIKit
import Domain
import Common

public struct LoginResource {
    
    public static let shared = LoginResource()
    
    public func login(order: Login, result: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        do {
            
            let encoded = try JSONEncoder().encode(order)
            let link = "https://empresas.ioasys.com.br/api/v1/users/auth/sign_in"
            guard let url = URL(string: link) else { return }
            var request = URLRequest(url: url)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            request.httpBody = encoded

            URLSession.shared.dataTask(
                with: request,
                completionHandler: { data, response, error in
                    
                    if let response = response as? HTTPURLResponse {
                        
                        let headers = response.allHeaderFields
                        
                        let accessToken = HeaderKeys.accessToken.rawValue
                        let client = HeaderKeys.client.rawValue
                        let uid = HeaderKeys.uid.rawValue
                        
                        var userAccess = UserAccess()
                        userAccess.accessToken = headers[accessToken] as? String
                        userAccess.client = headers[client] as? String
                        userAccess.uid = headers[uid] as? String
                        
                        AppStorage.shared.authorization = userAccess
                    }
                    result(data, response, error)
                }
            ).resume()
        } catch let error {
            result(nil, nil, error)
        }
    }
}

extension LoginResource {
    
    public enum HeaderKeys: String {
        case uid
        case client
        case accessToken = "access-token"
    }
}
