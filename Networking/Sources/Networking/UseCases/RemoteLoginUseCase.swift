//
//  RemoteLoginUseCase.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 04/08/21.
//

import Foundation

struct RemoteLoginUseCase: LoginUseCase {
    
    private let resource: LoginResource
    
    init(resource: LoginResource) {
        self.resource = resource
    }
    
    func login(email: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        
        resource.login(order: Login(email: email, password: password)) { (data, _, error) in
            
            if let error = error {
                DispatchQueue.main.async { completion(false, error) }
                return
            }
            
            if let data = data {
                let decodedOrder = try? JSONDecoder().decode(User.self, from: data)
                let success = decodedOrder?.success ?? false
                DispatchQueue.main.async { completion(success, nil) }
            }
        }
    }
}
