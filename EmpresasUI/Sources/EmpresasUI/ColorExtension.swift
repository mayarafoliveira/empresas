//
//  ColorExtension.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 13/07/21.
//

import UIKit

extension UIColor {
    
    public static var pinkMain: UIColor {
        return UIColor(named: "pink_main") ?? UIColor()
    }
    
    public static var grayText: UIColor {
        return UIColor(named: "gray_text") ?? UIColor()
    }
    
    public static var graySecondary: UIColor {
        return UIColor(named: "gray_secondary") ?? UIColor()
    }
    
    public static var redError: UIColor {
        return UIColor(named: "red_error") ?? UIColor()
    }
}
