//
//  DIContainer.swift
//  
//
//  Created by Mayara Ferreira de Oliveira on 18/08/21.
//

import Foundation

public class DIContainer {
    public static let shared = DIContainer()
    private var components = [String: Any]()
    
    private init() {}
    
    public func register<Component>(type: Component.Type, component: Component) {
        components["\(type)"] = component
    }
    
    public func resolve<Component>(type: Component.Type = Component.self) -> Component {
        guard let component = components["\(type)"] as? Component else {
            fatalError("\(type) not registered")
        }
        
        return component
    }
}
