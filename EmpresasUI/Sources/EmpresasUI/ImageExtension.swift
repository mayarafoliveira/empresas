//
//  ImageExtension.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 13/07/21.
//

import UIKit

extension UIImage {
    
    public static var backButton: UIImage {
        return UIImage(named: "back_button") ?? UIImage()
    }
    
    public static var backgroundHome: UIImage {
        return UIImage(named: "background_home") ?? UIImage()
    }
    
    public static var bigLoadingIcon: UIImage {
        return UIImage(named: "big_loading_icon") ?? UIImage()
    }
    
    public static var logoHome: UIImage {
        return UIImage(named: "logo_home") ?? UIImage()
    }
    
    public static var logoIoasys: UIImage {
        return UIImage(named: "logo_ioasys") ?? UIImage()
    }
    
    public static var redX: UIImage {
        return UIImage(named: "red_x") ?? UIImage()
    }
    
    public static var searchIcon: UIImage {
        return UIImage(named: "search_icon") ?? UIImage()
    }
    
    public static var smallLoadingIcon: UIImage {
        return UIImage(named: "small_loading_icon") ?? UIImage()
    }
    
    public static var visible: UIImage {
        return UIImage(named: "visible") ?? UIImage()
    }
    
    public static var searchBackground: UIImage {
        return UIImage(named: "search_background") ?? UIImage()
    }
}

extension UIImageView {
    public func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
