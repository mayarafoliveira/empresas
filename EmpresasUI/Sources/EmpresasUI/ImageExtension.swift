//
//  ImageExtension.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 13/07/21.
//

import UIKit

extension UIImage {
    
    public static var backButton: UIImage {
        setupAssetImage(named: "back_button")
    }
    
    public static var backgroundHome: UIImage {
        setupAssetImage(named: "background_home")
    }
    
    public static var bigLoadingIcon: UIImage {
        setupAssetImage(named: "big_loading_icon")
    }
    
    public static var invisible: UIImage {
        setupAssetImage(named: "invisible")
    }
    
    public static var logoHome: UIImage {
        setupAssetImage(named: "logo_home")
    }
    
    public static var redX: UIImage {
        setupAssetImage(named: "red_x")
    }
    
    public static var searchIcon: UIImage {
        setupAssetImage(named: "search_icon")
    }
    
    public static var smallLoadingIcon: UIImage {
        setupAssetImage(named: "small_loading_icon")
    }
    
    public static var visible: UIImage {
        setupAssetImage(named: "visible")
    }
    
    public static var searchBackground: UIImage {
        setupAssetImage(named: "search_background")
    }
    
    private static func setupAssetImage(named: String) -> UIImage {
        UIImage(named: named, in: .module, with: nil) ?? UIImage()
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
