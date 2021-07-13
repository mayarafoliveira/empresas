//
//  LoginView.swift
//  Empresas
//
//  Created by Mayara Ferreira de Oliveira on 13/07/21.
//

import UIKit

protocol CustomTeller: AnyObject {
    func signInButtonClicked(_: UIButton)
}

class LoginView: UIView {
    
    weak var delegate: CustomTeller?
    
    // Header
    private lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.image = .backgroundHome
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImage
    }()
    
    private lazy var headerStackView: UIStackView = {
        let headerStackView = UIStackView()
        headerStackView.axis = .vertical
        headerStackView.spacing = 16
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        return headerStackView
    }()
    
    private lazy var logoImage: UIImageView = {
        let logoImage = UIImageView()
        logoImage.image = .logoHome
        logoImage.contentMode = .scaleAspectFit
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        return logoImage
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Seja bem vindo ao Empresas!"
        welcomeLabel.textAlignment = .center
        welcomeLabel.textColor = .white
        welcomeLabel.font = UIFont.systemFont(ofSize: 20)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        return welcomeLabel
    }()
    
    // Sign in
    private lazy var loginStackView: UIStackView = {
        let loginStackView = UIStackView()
        loginStackView.axis = .vertical
        loginStackView.distribution = .fillEqually
        loginStackView.spacing = 16
        loginStackView.backgroundColor = .clear
        loginStackView.translatesAutoresizingMaskIntoConstraints = false
        return loginStackView
    }()

    private lazy var emailStackView: UIStackView = {
        let emailStackView = UIStackView()
        emailStackView.axis = .vertical
        emailStackView.spacing = 5
        emailStackView.backgroundColor = .clear
        emailStackView.translatesAutoresizingMaskIntoConstraints = false
        return emailStackView
    }()
    
    private lazy var passwordStackView: UIStackView = {
        let passwordStackView = UIStackView()
        passwordStackView.axis = .vertical
        passwordStackView.spacing = 5
        passwordStackView.backgroundColor = .clear
        passwordStackView.translatesAutoresizingMaskIntoConstraints = false
        return passwordStackView
    }()
    
    private lazy var emailLabel: UILabel = {
        let emailLabel = UILabel()
        emailLabel.text = "Email"
        emailLabel.textAlignment = .left
        emailLabel.textColor = .grayText
        emailLabel.font = UIFont.systemFont(ofSize: 14)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        return emailLabel
    }()
    
    private lazy var passwordLabel: UILabel = {
        let passwordLabel = UILabel()
        passwordLabel.text = "Senha"
        passwordLabel.textAlignment = .left
        passwordLabel.textColor = .grayText
        passwordLabel.font = UIFont.systemFont(ofSize: 14)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        return passwordLabel
    }()
    
    private lazy var emailView: UIView = {
        let emailView = UIView()
        emailView.backgroundColor = .graySecondary
        emailView.layer.cornerRadius = 4
        emailView.layer.borderWidth = 1
        emailView.layer.borderColor = UIColor.graySecondary.cgColor
        emailView.translatesAutoresizingMaskIntoConstraints = false
        return emailView
    }()
    
    private lazy var passwordView: UIView = {
        let passwordView = UIView()
        passwordView.backgroundColor = .graySecondary
        passwordView.layer.cornerRadius = 4
        passwordView.layer.borderWidth = 1
        passwordView.layer.borderColor = UIColor.graySecondary.cgColor
        passwordView.translatesAutoresizingMaskIntoConstraints = false
        return passwordView
    }()
    
    private lazy var emailTextField: UITextField = {
        
        let emailTextField = UITextField()
        emailTextField.borderStyle = .none
        emailTextField.backgroundColor = .clear
        emailTextField.keyboardType = .emailAddress
        emailTextField.autocapitalizationType = .none
        emailTextField.autocorrectionType = .no
        emailTextField.tintColor = .pinkMain
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return emailTextField
    }()
    
    private lazy var passwordTextField: UITextField = {
        
        let passwordTextField = UITextField()
        passwordTextField.borderStyle = .none
        passwordTextField.backgroundColor = .clear
        passwordTextField.keyboardType = .default
        passwordTextField.isSecureTextEntry = true
        passwordTextField.tintColor = .pinkMain
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        return passwordTextField
    }()
    
    private lazy var signInButton: UIButton = {

        let signInButton = UIButton()
        signInButton.backgroundColor = .pinkMain
        signInButton.layer.cornerRadius = 8
        signInButton.setTitle("ENTRAR", for: .normal)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.setTitleColor(.gray, for: .highlighted)
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        return signInButton
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
    
        self.setBackgroundColor(to: .white)
        addSubviews()
        setupConstraints()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Actions
    @objc func signInAction(sender: UIButton) {
       
        let networking = Networking()
        
        guard let email = emailTextField.text,
              let password = passwordTextField.text
        else { return }
        
        let values = Login(email: email, password: password)
        
        networking.login(order: values) { success, error  in
      
            if success {
                self.delegate?.signInButtonClicked(sender)
                
            } else {
                if let error = error { print(error.localizedDescription) }
                self.emailView.layer.borderColor = UIColor.redError.cgColor
                self.passwordView.layer.borderColor = UIColor.redError.cgColor
            }
        }
    }
}

extension LoginView {
    
    // MARK: Subviews
    func addSubviews() {
        self.addSubview(backgroundImage)
        self.backgroundImage.addSubview(headerStackView)
        self.headerStackView.addArrangedSubview(logoImage)
        self.headerStackView.addArrangedSubview(welcomeLabel)
        
        self.addSubview(loginStackView)
        self.loginStackView.addArrangedSubview(emailStackView)
        self.loginStackView.addArrangedSubview(passwordStackView)
        self.emailStackView.addArrangedSubview(emailLabel)
        self.emailStackView.addArrangedSubview(emailView)
        self.emailView.addSubview(emailTextField)
        self.passwordStackView.addArrangedSubview(passwordLabel)
        self.passwordStackView.addArrangedSubview(passwordView)
        self.passwordView.addSubview(passwordTextField)
       
        self.addSubview(signInButton)
    }
    
    // MARK: Setup Constraints
    func setupConstraints() {
        setupBackgroundImageConstraints()
        setupHeaderStackViewConstraints()
        setupLoginStackViewConstraints()
        setupEmailViewConstraints()
        setupPasswordViewConstraints()
        setupEmailTextFieldConstraints()
        setupPasswordTextFieldConstraints()
        setupSignInButtonConstraints()
    }
    
    // Header
    func setupBackgroundImageConstraints() {
        backgroundImage.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        backgroundImage.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        backgroundImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backgroundImage.heightAnchor.constraint(equalTo: self.heightAnchor,
                                                multiplier: 1.0/3.0).isActive = true
    }
    
    func setupHeaderStackViewConstraints() {
        headerStackView.rightAnchor.constraint(equalTo: self.backgroundImage.rightAnchor, constant: -20).isActive = true
        headerStackView.leftAnchor.constraint(equalTo: self.backgroundImage.leftAnchor, constant: 20).isActive = true
        headerStackView.centerYAnchor.constraint(equalTo: self.backgroundImage.centerYAnchor).isActive = true
    }
    
    // Sign in
    func setupLoginStackViewConstraints() {
        loginStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        loginStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        loginStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    func setupEmailViewConstraints() {
        emailView.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    func setupPasswordViewConstraints() {
        passwordView.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    func setupEmailTextFieldConstraints() {
        emailTextField.rightAnchor.constraint(equalTo: self.emailView.rightAnchor, constant: -12).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: self.emailView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: self.emailView.topAnchor, constant: 5).isActive = true
        emailTextField.bottomAnchor.constraint(equalTo: self.emailView.bottomAnchor, constant: -5).isActive = true
    }
    
    func setupPasswordTextFieldConstraints() {
        passwordTextField.rightAnchor.constraint(equalTo: self.passwordView.rightAnchor, constant: -12).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: self.passwordView.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: self.passwordView.topAnchor, constant: 5).isActive = true
        passwordTextField.bottomAnchor.constraint(equalTo: self.passwordView.bottomAnchor, constant: -5).isActive = true
    }
    
    func setupSignInButtonConstraints() {
        signInButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40).isActive = true
        signInButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40).isActive = true
        signInButton.topAnchor.constraint(equalTo: self.loginStackView.bottomAnchor, constant: 40).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
}

// MARK: TextField
extension LoginView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailLabel.textColor = .pinkMain
            emailView.layer.borderColor = UIColor.graySecondary.cgColor
            passwordView.layer.borderColor = UIColor.graySecondary.cgColor
            
        } else {
            passwordLabel.textColor = .pinkMain
            emailView.layer.borderColor = UIColor.graySecondary.cgColor
            passwordView.layer.borderColor = UIColor.graySecondary.cgColor
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailLabel.textColor = .grayText
        } else {
            passwordLabel.textColor = .grayText
        }
    }
}
