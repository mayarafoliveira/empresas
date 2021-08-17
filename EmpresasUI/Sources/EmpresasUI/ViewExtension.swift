//
//  ViewExtension.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 13/07/21.
//

import UIKit

extension UIView {
    
    public func setBackgroundColor(to color: UIColor) {
        self.backgroundColor = color
    }
    
    public var notchHeight: CGFloat {
        return self.window?.safeAreaInsets.bottom ?? 0
    }
}
