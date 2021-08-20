//
//  AppStorage.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 16/07/21.
//

import Foundation
import Domain

public class AppStorage {
    
    public static let shared = AppStorage()
    private let userAccessKey = "userAccess"
    
    public var authorization: UserAccess? {
        
        get {
            let userDefaults = UserDefaults.standard
            guard let data = userDefaults.value(forKey: userAccessKey) as? Data else {
                return nil
            }
            
            let userAccessDecoded = try? JSONDecoder().decode(UserAccess.self, from: data)
            
            return userAccessDecoded
        }
        
        set(userAccess) {
            guard let userAccessEncoded = try? JSONEncoder().encode(userAccess) else {
                print("Failed to encode order")
                return
            }
            let userDefaults = UserDefaults.standard
            userDefaults.setValue(userAccessEncoded, forKey: userAccessKey)
        }
    }
}
