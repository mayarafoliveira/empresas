//
//  SearchPresenting.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 03/08/21.
//

import Foundation
import Domain

public protocol SearchPresenting: AnyObject {
    func searchFor(_ enterprise: String)
    func attach(view: SearchViewable)
    func showEnterpriseDetail(_ enterprise: Enterprise)
}
