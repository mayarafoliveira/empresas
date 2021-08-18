//
//  ColorExtension.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 13/07/21.
//

import UIKit

extension UIColor {
    
    public static var pinkMain: UIColor {
        setupAssetColor(named: "pink_main")
    }
    
    public static var grayText: UIColor {
        setupAssetColor(named: "gray_text")
    }
    
    public static var graySecondary: UIColor {
        setupAssetColor(named: "gray_secondary")
    }
    
    public static var redError: UIColor {
        setupAssetColor(named: "red_error")
    }
    
    public static func setupAssetColor(named: String) -> UIColor {
        return UIColor(named: named, in: .module, compatibleWith: nil) ?? UIColor()
    }
}
