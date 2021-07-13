//
//  ImageExtension.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 13/07/21.
//

import UIKit

extension UIImage {
    
    static var backgroundHome: UIImage {
        return UIImage(named: "background_home") ?? UIImage()
    }
    
    static var bigLoadingIcon: UIImage {
        return UIImage(named: "big_loading_icon") ?? UIImage()
    }
    
    static var logoHome: UIImage {
        return UIImage(named: "logo_home") ?? UIImage()
    }
    
    static var logoIoasys: UIImage {
        return UIImage(named: "logo_ioasys") ?? UIImage()
    }
    
    static var redX: UIImage {
        return UIImage(named: "red_x") ?? UIImage()
    }
    
    static var searchIcon: UIImage {
        return UIImage(named: "search_icon") ?? UIImage()
    }
    
    static var smallLoadingIcon: UIImage {
        return UIImage(named: "small_loading_icon") ?? UIImage()
    }
    
    static var visible: UIImage {
        return UIImage(named: "visible") ?? UIImage()
    }
    
    static var searchBackground: UIImage {
        return UIImage(named: "search_background") ?? UIImage()
    }
}

extension UIImageView {
    func load(url: URL) {
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
