//
//  EnterpriseDetailPresenting.swift
//  
//
//  Created by Mayara Ferreira de Oliveira on 19/08/21.
//

import Foundation
import Domain

public protocol EnterpriseDetailPresenting: AnyObject {
    func attach(view: EnterpriseDetailViewable)
    var enterprise: Enterprise { get }
}
