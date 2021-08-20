//
//  BaseViewController.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 22/07/21.
//

import UIKit

open class BaseViewController: UIViewController {

    open override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public func setupCustomNavigation() {
        navigationController?.navigationBar.setBackgroundImage(
            UIImage(), for: .default)
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.backIndicatorImage = .backButton
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = .backButton
    }
    
}
