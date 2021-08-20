//
//  SearchUseCase.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 05/08/21.
//

import Foundation

public protocol SearchUseCase {
    func searchEnterprise(text: Search, completion: @escaping (SearchResult?, Error?) -> Void)
}
