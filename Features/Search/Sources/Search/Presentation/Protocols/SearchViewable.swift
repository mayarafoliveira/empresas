//
//  SearchViewable.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 03/08/21.
//

import Foundation
import Domain

public protocol SearchViewable: AnyObject {
    func updateList(_ enterprises: [Enterprise])
}
