//
//  RemoteSearchUseCase.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 05/08/21.
//

import Foundation

struct RemoteSearchUseCase: SearchUseCase {
    
    private let resource: SearchResource
    
    init(resource: SearchResource) {
        self.resource = resource
    }
    
    func searchEnterprise(text: Search, completion: @escaping (SearchResult?, Error?) -> Void) {
        
        resource.searchEnterprise(text: text) { data, _, error  in
            
            if let error = error {
                DispatchQueue.main.async { completion(nil, error) }
                return
            }
            
            if let data = data {
        
                let enterprises = try? JSONDecoder().decode(SearchResult.self, from: data)
                DispatchQueue.main.async { completion(enterprises, nil) }
            }
        }
    }
}
