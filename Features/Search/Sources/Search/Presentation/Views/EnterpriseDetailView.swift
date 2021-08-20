//
//  EnterpriseDetailView.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 13/07/21.
//

import UIKit
import Domain

public protocol EnterpriseDetailDelegate: AnyObject {}

public class EnterpriseDetailView: UIView {
    
    private var enterprise: Enterprise?
    weak var delegate: EnterpriseDetailDelegate?
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    lazy var enterpriseName: UILabel = {
        let enterpriseName = UILabel()
        enterpriseName.text = enterprise?.enterpriseName
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
        enterpriseDescription.text = enterprise?.description
        enterpriseDescription.numberOfLines = 0
        enterpriseDescription.textAlignment = .left
        enterpriseDescription.textColor = .black
        enterpriseDescription.font = UIFont.systemFont(ofSize: 18)
        enterpriseDescription.translatesAutoresizingMaskIntoConstraints = false
        return enterpriseDescription
    }()
    
    public init(enterprise: Enterprise?) {
        super.init(frame: .zero)
        self.enterprise = enterprise
        self.setBackgroundColor(to: .white)
        
        addSubviews()
        setupConstraints()
        updateBackgroundImage()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    func updateBackgroundImage() {
        let host = "https://empresas.ioasys.com.br"
        guard let photo = self.enterprise?.photo else { return }
        guard let url = URL(string: host + photo) else { return }
        backgroundImage.load(url: url)
    }
}

extension EnterpriseDetailView {
    
    // MARK: Subviews
    func addSubviews() {
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        self.addSubview(enterpriseName)
        self.contentView.addSubview(backgroundImage)
        self.contentView.addSubview(enterpriseDescription)
    }
    
    // MARK: Setup Constraints
    func setupConstraints() {
        setupScrollViewConstraints()
        setupContentViewConstraints()
        setupEnterpriseNameConstraints()
        setupBackgroundImageConstraints()
        setupEnterpriseDescriptionConstraints()
    }
    
    func setupScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.rightAnchor.constraint(
                equalTo: self.rightAnchor
            ),
            scrollView.leftAnchor.constraint(
                equalTo: self.leftAnchor
            ),
            scrollView.topAnchor.constraint(
                equalTo: self.enterpriseName.bottomAnchor,
                constant: 5
            ),
            scrollView.bottomAnchor.constraint(
                equalTo: self.bottomAnchor
            )
        ])
    }
    
    func setupContentViewConstraints() {
        NSLayoutConstraint.activate([
            contentView.rightAnchor.constraint(
                equalTo: self.scrollView.rightAnchor
            ),
            contentView.leftAnchor.constraint(
                equalTo: self.scrollView.leftAnchor
            ),
            contentView.topAnchor.constraint(
                equalTo: self.scrollView.topAnchor
            ),
            contentView.bottomAnchor.constraint(
                equalTo: self.scrollView.bottomAnchor
            ),
            contentView.widthAnchor.constraint(
                equalTo: self.scrollView.widthAnchor
            )
        ])
    }
    
    func setupEnterpriseNameConstraints() {
        NSLayoutConstraint.activate([
            enterpriseName.rightAnchor.constraint(
                equalTo: self.rightAnchor,
                constant: -20
            ),
            enterpriseName.leftAnchor.constraint(
                equalTo: self.leftAnchor,
                constant: 20
            ),
            enterpriseName.topAnchor.constraint(
                equalTo: self.topAnchor,
                constant: 40
            ),
            enterpriseName.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func setupBackgroundImageConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            backgroundImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            backgroundImage.topAnchor.constraint(
                equalTo: self.contentView.topAnchor,
                constant: 40
            ),
            backgroundImage.heightAnchor.constraint(
                equalTo: self.heightAnchor,
                multiplier: 1.0/4.0
            )
        ])
    }
    
    func setupEnterpriseDescriptionConstraints() {
        NSLayoutConstraint.activate([
            enterpriseDescription.rightAnchor.constraint(
                equalTo: self.contentView.rightAnchor,
                constant: -20
            ),
            enterpriseDescription.leftAnchor.constraint(
                equalTo: self.contentView.leftAnchor,
                constant: 20
            ),
            enterpriseDescription.topAnchor.constraint(
                equalTo: self.backgroundImage.bottomAnchor,
                constant: 20
            ),
            enterpriseDescription.bottomAnchor.constraint(
                lessThanOrEqualTo: self.contentView.bottomAnchor,
                constant: -20
            )
        ])
    }
}
