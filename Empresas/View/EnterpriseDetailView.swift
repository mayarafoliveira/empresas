//
//  EnterpriseDetailView.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 13/07/21.
//

import UIKit

class EnterpriseDetailView: UIView {
    
    lazy var enterpriseName: UILabel = {
        let enterpriseName = UILabel()
        enterpriseName.textAlignment = .center
        enterpriseName.textColor = .black
        enterpriseName.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        enterpriseName.translatesAutoresizingMaskIntoConstraints = false
        return enterpriseName
    }()
    
    lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImage
    }()
    
    lazy var enterpriseDescription: UILabel = {
        let enterpriseDescription = UILabel()
        enterpriseDescription.numberOfLines = 0
        enterpriseDescription.textAlignment = .left
        enterpriseDescription.textColor = .black
        enterpriseDescription.font = UIFont.systemFont(ofSize: 18)
        enterpriseDescription.translatesAutoresizingMaskIntoConstraints = false
        return enterpriseDescription
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
    
        self.setBackgroundColor(to: .white)
        addSubviews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EnterpriseDetailView {
    
    // MARK: Subviews
    func addSubviews() {
        self.addSubview(enterpriseName)
        self.addSubview(backgroundImage)
        self.addSubview(enterpriseDescription)
    }
    
    // MARK: Setup Constraints
    func setupConstraints() {
        setupEnterpriseNameConstraints()
        setupBackgroundImageConstraints()
        setupEnterpriseDescriptionConstraints()
    }
    
    func setupEnterpriseNameConstraints() {
        enterpriseName.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        enterpriseName.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        enterpriseName.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        enterpriseName.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupBackgroundImageConstraints() {
        backgroundImage.rightAnchor.constraint(equalTo: self.rightAnchor)
            .isActive = true
        backgroundImage.leftAnchor.constraint(equalTo: self.leftAnchor)
            .isActive = true
        backgroundImage.topAnchor.constraint(
            equalTo: self.enterpriseName.bottomAnchor,
            constant: 40).isActive = true
        backgroundImage.heightAnchor.constraint(equalTo: self.heightAnchor,
                                                multiplier: 1.0/4.0).isActive = true
    }
    
    func setupEnterpriseDescriptionConstraints() {
        enterpriseDescription.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        enterpriseDescription.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        enterpriseDescription.topAnchor.constraint(equalTo: self.backgroundImage.bottomAnchor, constant: 20).isActive = true
        enterpriseDescription.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: 20).isActive = true
    }
}

