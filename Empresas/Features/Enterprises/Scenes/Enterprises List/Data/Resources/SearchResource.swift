//
//  SearchResource.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 05/08/21.
//

import Foundation

struct SearchResource {
    static let shared = SearchResource()
    
    func searchEnterprise(text: Search, result: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        let accessToken = HeaderKeys.accessToken.rawValue
        let client = HeaderKeys.client.rawValue
        let uid = HeaderKeys.uid.rawValue
        
        guard let userAccess = AppStorage.shared.authorization else { return }
        guard let userAccessToken = userAccess.accessToken,
              let userClient = userAccess.client,
              let userUid = userAccess.uid
              else { return }
        
        let link = "https://empresas.ioasys.com.br/api/v1/enterprises?name=" + text.enterpriseSearched
        
        guard let url = URL(string: link) else { return }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(userAccessToken, forHTTPHeaderField: accessToken)
        request.addValue(userClient, forHTTPHeaderField: client)
        request.addValue(userUid, forHTTPHeaderField: uid)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request, completionHandler: result).resume()
    }
}

extension SearchResource {
    
    enum HeaderKeys: String {
        case uid
        case client
        case accessToken = "access-token"
    }
}
