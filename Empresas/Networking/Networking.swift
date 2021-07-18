//
//  Networking.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 13/07/21.
//

import Foundation

class Networking {
    
    enum HeaderKeys: String {
        case uid
        case client
        case accessToken = "access-token"
    }
    
    func login(order: Login, completion: @escaping (Bool, Error?) -> Void) {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }

        let link = "https://empresas.ioasys.com.br/api/v1/users/auth/sign_in"
        guard let url = URL(string: link) else { return }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = HTTPMethod.post.rawValue
        request.httpBody = encoded

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                DispatchQueue.main.async { completion(false, error) }
                return
            }
            
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
            
            if let data = data {
        
                let decodedOrder = try? JSONDecoder().decode(User.self, from: data)
                let success = decodedOrder?.success ?? false
                DispatchQueue.main.async { completion(success, nil) }
            }
        }
        task.resume()
    }
    
    func searchEnterprise(text: Search, completion: @escaping (SearchResult?, Error?) -> Void) {
        
        let accessToken = HeaderKeys.accessToken.rawValue
        let client = HeaderKeys.client.rawValue
        let uid = HeaderKeys.uid.rawValue
        
        guard let userAccessToken =
            UserDefaults.standard.string(forKey: accessToken),
            let userClient = UserDefaults.standard.string(forKey: client),
            let userUid = UserDefaults.standard.string(forKey: uid) else {
            return
        }

        let link = "https://empresas.ioasys.com.br/api/v1/enterprises?name=" + text.enterpriseSearched
        
        guard let url = URL(string: link) else { return }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(userAccessToken, forHTTPHeaderField: accessToken)
        request.addValue(userClient, forHTTPHeaderField: client)
        request.addValue(userUid, forHTTPHeaderField: uid)
        request.httpMethod = HTTPMethod.get.rawValue
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                DispatchQueue.main.async { completion(nil, error) }
                return
            }
            
            if let response = response {
                print(response)
            }
            
            if let data = data {
        
                let enterprises = try? JSONDecoder().decode(SearchResult.self, from: data)
                DispatchQueue.main.async { completion(enterprises, nil) }
            }
        }
        task.resume()
    }
}
