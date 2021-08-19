//
//  EnterpriseDetailPresenter.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 20/07/21.
//

import UIKit
import Domain

public class EnterpriseDetailPresenter: EnterpriseDetailPresenting {
    public var enterprise: Enterprise
    weak var view: EnterpriseDetailViewable?
    private let coordinator: EnterpriseDetailCoordinating
    
    public init(coordinator: EnterpriseDetailCoordinating, enterprise: Enterprise) {
        self.coordinator = coordinator
        self.enterprise = enterprise
    }
    
    public func attach(view: EnterpriseDetailViewable) {
        self.view = view
    }
}
