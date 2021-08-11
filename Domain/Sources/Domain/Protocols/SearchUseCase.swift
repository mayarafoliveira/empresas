//
//  SearchUseCase.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 05/08/21.
//

import Foundation

protocol SearchUseCase {
    func searchEnterprise(text: Search, completion: @escaping (SearchResult?, Error?) -> Void)
}
