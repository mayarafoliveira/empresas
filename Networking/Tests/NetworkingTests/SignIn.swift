//
//  SignIn.swift
//  
//
//  Created by Mayara Ferreira de Oliveira on 31/08/21.
//

import UIKit
import Domain
import Networking

class SignIn {
    
    func userAuthentication(completion: @escaping (Bool, Error?) -> Void) {

        let loginData = Login(email: "testeapple@ioasys.com.br",
                              password: "12341234")
        
        let resource: LoginResource = .shared
        
        resource.login(order: loginData) {_, response, error in
            completion(response != nil, error)
        }
    }
}
