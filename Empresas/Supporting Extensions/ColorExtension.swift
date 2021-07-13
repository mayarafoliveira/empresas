//
//  ColorExtension.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 13/07/21.
//

import UIKit

extension UIColor {
    
    static var pinkMain: UIColor {
        return UIColor(named: "pink_main") ?? UIColor()
    }
    
    static var grayText: UIColor {
        return UIColor(named: "gray_text") ?? UIColor()
    }
    
    static var graySecondary: UIColor {
        return UIColor(named: "gray_secondary") ?? UIColor()
    }
    
    static var redError: UIColor {
        return UIColor(named: "red_error") ?? UIColor()
    }
}
