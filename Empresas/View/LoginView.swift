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
    private let userDefaults = UserDefaults()
    
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
    private(set) lazy var loginStackView: UIStackView = {
        let loginStackView = UIStackView()
        loginStackView.axis = .vertical
        loginStackView.distribution = .fill
        loginStackView.spacing = 4
        loginStackView.backgroundColor = .clear
        loginStackView.translatesAutoresizingMaskIntoConstraints = false
        return loginStackView
    }()
    
    private(set) lazy var emailLabel: UILabel = {
        let emailLabel = UILabel()
        emailLabel.text = "E-mail"
        emailLabel.textAlignment = .left
        emailLabel.textColor = .grayText
        emailLabel.font = UIFont.systemFont(ofSize: 14)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        return emailLabel
    }()
    
    private(set) lazy var emailView: UIView = {
        let emailView = UIView()
        emailView.backgroundColor = .white
        emailView.layer.cornerRadius = 4
        emailView.layer.borderWidth = 1
        emailView.layer.borderColor = UIColor.graySecondary.cgColor
        emailView.translatesAutoresizingMaskIntoConstraints = false
        return emailView
    }()
    
    private(set) lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.placeholder = "Insira seu e-mail"
        emailTextField.font = UIFont.systemFont(ofSize: 14)
        emailTextField.borderStyle = .none
        emailTextField.backgroundColor = .clear
        emailTextField.keyboardType = .emailAddress
        emailTextField.autocapitalizationType = .none
        emailTextField.autocorrectionType = .no
        emailTextField.tintColor = .pinkMain
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        return emailTextField
    }()
    
    private(set) lazy var emailErrorImage: UIImageView = {
        let emailErrorImage = UIImageView()
        emailErrorImage.image = .redX
        emailErrorImage.contentMode = .scaleAspectFit
        emailErrorImage.isHidden = true
        emailErrorImage.translatesAutoresizingMaskIntoConstraints = false
        return emailErrorImage
    }()
    
    private(set) lazy var emailWarningLabel: UILabel = {
        let emailWarningLabel = UILabel()
        emailWarningLabel.text = "E-mail incorreto"
        emailWarningLabel.textAlignment = .left
        emailWarningLabel.textColor = .clear
        emailWarningLabel.font = UIFont.systemFont(ofSize: 12)
        emailWarningLabel.translatesAutoresizingMaskIntoConstraints = false
        return emailWarningLabel
    }()
    
    private(set) lazy var passwordLabel: UILabel = {
        let passwordLabel = UILabel()
        passwordLabel.text = "Senha"
        passwordLabel.textAlignment = .left
        passwordLabel.textColor = .grayText
        passwordLabel.font = UIFont.systemFont(ofSize: 14)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        return passwordLabel
    }()
    
    private(set) lazy var passwordView: UIView = {
        let passwordView = UIView()
        passwordView.backgroundColor = .white
        passwordView.layer.cornerRadius = 4
        passwordView.layer.borderWidth = 1
        passwordView.layer.borderColor = UIColor.graySecondary.cgColor
        passwordView.translatesAutoresizingMaskIntoConstraints = false
        return passwordView
    }()
    
    private(set) lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Insira sua senha"
        passwordTextField.font = UIFont.systemFont(ofSize: 14)
        passwordTextField.borderStyle = .none
        passwordTextField.backgroundColor = .clear
        passwordTextField.isSecureTextEntry = true
        passwordTextField.keyboardType = .default
        passwordTextField.autocapitalizationType = .none
        passwordTextField.autocorrectionType = .no
        passwordTextField.tintColor = .pinkMain
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        return passwordTextField
    }()
    
    private(set) lazy var passwordErrorImage: UIImageView = {
        let passwordErrorImage = UIImageView()
        passwordErrorImage.image = .redX
        passwordErrorImage.contentMode = .scaleAspectFit
        passwordErrorImage.isHidden = true
        passwordErrorImage.translatesAutoresizingMaskIntoConstraints = false
        return passwordErrorImage
    }()
    
    private(set) lazy var passwordWarningLabel: UILabel = {
        let passwordWarningLabel = UILabel()
        passwordWarningLabel.text = "Senha inválida"
        passwordWarningLabel.textAlignment = .left
        passwordWarningLabel.textColor = .clear
        passwordWarningLabel.font = UIFont.systemFont(ofSize: 12)
        passwordWarningLabel.translatesAutoresizingMaskIntoConstraints = false
        return passwordWarningLabel
    }()
    
    private(set) lazy var showPasswordButton: UIButton = {
        let showPasswordButton = UIButton()
        showPasswordButton.backgroundColor = .clear
        showPasswordButton.setTitle(.none, for: .normal)
        showPasswordButton.imageView?.contentMode = .scaleAspectFit
        showPasswordButton.setImage(.visible, for: .normal)
        showPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        showPasswordButton.addTarget(self, action: #selector(showPasswordAction), for: .touchUpInside)
        return showPasswordButton
    }()
    
    private lazy var signInButton: UIButton = {

        let signInButton = UIButton()
        signInButton.isEnabled = false
        signInButton.backgroundColor = .graySecondary
        signInButton.layer.cornerRadius = 8
        signInButton.setTitle("ENTRAR", for: .normal)
        signInButton.setTitleColor(.lightGray, for: .disabled)
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
    
    @objc func showPasswordAction(sender: UIButton) {
        switch sender.backgroundColor {
        case UIColor.clear:
            sender.backgroundColor = .pinkMain
            passwordTextField.isSecureTextEntry = false
        default:
            sender.backgroundColor = .clear
            passwordTextField.isSecureTextEntry = true
        }
    }
    
    @objc func signInAction(sender: UIButton) {
       
        let networking = Networking()
        
        guard let email = emailTextField.text,
              let password = passwordTextField.text
        else { return }
        
        let values = Login(email: email, password: password)
        
        networking.login(order: values) { success, error  in
      
            if success {
                self.userDefaults.setValue(email, forKey: "email")
                self.delegate?.signInButtonClicked(sender)
                
            } else {
                if let error = error { print(error.localizedDescription) }
                
                self.emailTextField.invalidField(
                    titleLabel: self.emailLabel,
                    errorImage: self.emailErrorImage,
                    warningLabel: self.emailWarningLabel)
                
                self.passwordTextField.invalidField(
                    titleLabel: self.passwordLabel,
                    errorImage: self.passwordErrorImage,
                    warningLabel: self.passwordWarningLabel,
                    showPasswordButton: self.showPasswordButton)
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
        self.emailView.addSubview(emailTextField)
        self.emailView.addSubview(emailErrorImage)
        self.loginStackView.addArrangedSubview(emailLabel)
        self.loginStackView.addArrangedSubview(emailView)
        self.loginStackView.addArrangedSubview(emailWarningLabel)
        self.passwordView.addSubview(passwordTextField)
        self.passwordView.addSubview(passwordErrorImage)
        self.passwordView.insertSubview(showPasswordButton,
                                        belowSubview: passwordErrorImage)
        self.loginStackView.addArrangedSubview(passwordLabel)
        self.loginStackView.addArrangedSubview(passwordView)
        self.loginStackView.addArrangedSubview(passwordWarningLabel)
       
        self.addSubview(signInButton)
    }
    
    // MARK: Setup Constraints
    func setupConstraints() {
        setupBackgroundImageConstraints()
        setupHeaderStackViewConstraints()
        
        setupLoginStackViewConstraints()
        setupEmailViewConstraints()
        setupEmailErrorImageConstraints()
        setupEmailTextFieldConstraints()
        setupPasswordViewConstraints()
        setupPasswordErrorImageConstraints()
        setupShowPasswordButtonConstraints()
        setupPasswordTextFieldConstraints()
        
        self.loginStackView.setCustomSpacing(8, after: self.emailLabel)
        self.loginStackView.setCustomSpacing(20, after: self.emailWarningLabel)
        self.loginStackView.setCustomSpacing(8, after: self.passwordLabel)
        
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
    
    func setupLoginStackViewConstraints() {
        NSLayoutConstraint.activate([
            loginStackView.topAnchor.constraint(equalTo: self.backgroundImage.bottomAnchor, constant: 40),
            loginStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24),
            loginStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24)
        ])
    }
    
    func setupEmailViewConstraints() {
        emailView.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
 
    func setupEmailErrorImageConstraints() {
        NSLayoutConstraint.activate([
            emailErrorImage.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            emailErrorImage.widthAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            emailErrorImage.rightAnchor.constraint(equalTo: self.emailView.rightAnchor, constant: -12),
            emailErrorImage.centerYAnchor.constraint(equalTo: self.emailView.centerYAnchor)
        ])
    }
    
    func setupEmailTextFieldConstraints() {
        NSLayoutConstraint.activate([
            emailTextField.rightAnchor.constraint(equalTo: self.emailErrorImage.leftAnchor),
            emailTextField.leftAnchor.constraint(equalTo: self.emailView.leftAnchor, constant: 12),
            emailTextField.topAnchor.constraint(equalTo: self.emailView.topAnchor, constant: 5),
            emailTextField.bottomAnchor.constraint(equalTo: self.emailView.bottomAnchor, constant: -5)
        ])
    }
    
    func setupPasswordViewConstraints() {
        passwordView.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    func setupPasswordErrorImageConstraints() {
        NSLayoutConstraint.activate([
            passwordErrorImage.heightAnchor.constraint(equalTo: self.passwordTextField.heightAnchor),
            passwordErrorImage.widthAnchor.constraint(equalTo: self.passwordTextField.heightAnchor),
            passwordErrorImage.rightAnchor.constraint(equalTo: self.passwordView.rightAnchor, constant: -12),
            passwordErrorImage.centerYAnchor.constraint(equalTo: self.passwordView.centerYAnchor)
        ])
    }
    
    func setupShowPasswordButtonConstraints() {
        NSLayoutConstraint.activate([
            showPasswordButton.heightAnchor.constraint(equalTo: self.passwordTextField.heightAnchor),
            showPasswordButton.widthAnchor.constraint(equalTo: self.passwordTextField.heightAnchor),
            showPasswordButton.rightAnchor.constraint(equalTo: self.passwordView.rightAnchor, constant: -12),
            showPasswordButton.centerYAnchor.constraint(equalTo: self.passwordView.centerYAnchor)
        ])
    }
    
    func setupPasswordTextFieldConstraints() {
        NSLayoutConstraint.activate([
            passwordTextField.rightAnchor.constraint(equalTo: self.passwordErrorImage.leftAnchor),
            passwordTextField.leftAnchor.constraint(equalTo: self.passwordView.leftAnchor, constant: 12),
            passwordTextField.topAnchor.constraint(equalTo: self.passwordView.topAnchor, constant: 5),
            passwordTextField.bottomAnchor.constraint(equalTo: self.passwordView.bottomAnchor, constant: -5)
        ])
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
        
        switch textField {
        case emailTextField:
            textField.setBorderColorIfNeeded(titleLabel: emailLabel, errorImage: emailErrorImage, warningLabel: emailWarningLabel)
        default:
            textField.setBorderColorIfNeeded(titleLabel: passwordLabel, errorImage: passwordErrorImage, warningLabel: passwordWarningLabel)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {

        switch textField {
        case emailTextField:
            textField.setBorderColorIfNeeded(titleLabel: emailLabel, errorImage: emailErrorImage, warningLabel: emailWarningLabel)
        default:
            textField.setBorderColorIfNeeded(titleLabel: passwordLabel,
                                             errorImage: passwordErrorImage,
                                             warningLabel: passwordWarningLabel,
                                             showPasswordButton: showPasswordButton)
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        guard let emailText = emailTextField.text else { return }
        guard let passwordText = passwordTextField.text else { return }
        
        if emailText.isEmpty || passwordText.isEmpty {
            signInButton.isEnabled = false
            signInButton.backgroundColor = .graySecondary
        } else {
            signInButton.isEnabled = true
            signInButton.backgroundColor = .pinkMain
        }
    }
    
}
