//
//  TextFieldExtension.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 14/07/21.
//

import UIKit

extension UITextField {
    
    /// Shows which field is already filled in or which one you are typing
    func setBorderColorIfNeeded(titleLabel: UILabel,
                                errorImage: UIImageView? = nil,
                                warningLabel: UILabel? = nil,
                                showPasswordButton: UIButton? = nil) {
        guard let view = self.superview else { return }
        
        warningLabel?.textColor = .clear
        errorImage?.isHidden = true
        showPasswordButton?.isEnabled = true
        showPasswordButton?.isHidden = false
        view.layer.borderColor = UIColor.graySecondary.cgColor
        
        if self.isEditing {
            titleLabel.textColor = .pinkMain
        } else {
            titleLabel.textColor = .grayText
        }
    }
    
    /// Shows which field is invalid
    func invalidField(errorImage: UIImageView? = nil,
                      warningLabel: UILabel? = nil,
                      showPasswordButton: UIButton? = nil) {
        guard let view = self.superview else { return }
        
        view.layer.borderColor = UIColor.redError.cgColor
        warningLabel?.textColor = .redError
        errorImage?.isHidden = false
        showPasswordButton?.isEnabled = false
        showPasswordButton?.isHidden = true
    }
}
