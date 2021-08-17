//
//  AppCoordinatorDelegate.swift
//  
//
//  Created by Mayara Ferreira de Oliveira on 17/08/21.
//

import UIKit

public protocol AppCoordinatorDelegate: AnyObject {
    func showLogin(rootViewController: UINavigationController)
    func showSearch(rootViewController: UINavigationController)
}
