//
//  LoginViewController.swift
//  Banka
//
//  Created by Juan Arbelaez on 17/02/25.
//

import Foundation
import UIKit

protocol LogoutDelegate: Any {
    func didLogout()
}

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}


class LoginViewController: UIViewController {
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton()
    let errorLabel = UILabel()
    let resetPasswordButton = UIButton()
    
    weak var delegate: LoginViewControllerDelegate?
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        style()
        layout()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        loginView.passwordTextField.text = ""
        loginView.usernameTextField.text = ""
    }
}

extension LoginViewController {
    func style(){
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "BanKa"
//        titleLabel.textColor = appColor
        titleLabel.font = UIFont.boldSystemFont(ofSize: 40)
        titleLabel.textAlignment = .left
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.text = "Tu banco aliado"
        subtitleLabel.font = UIFont.systemFont(ofSize: 24)
        subtitleLabel.textAlignment = .left
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        resetPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        resetPasswordButton.configuration = .borderless()
        resetPasswordButton.setTitle("Olvidó la contraseña?", for: [])
        resetPasswordButton.configuration?.buttonSize = .mini
        resetPasswordButton.tintColor = .lightGray

        resetPasswordButton.addTarget(self, action: #selector(resetPasswordTapped), for: .primaryActionTriggered)
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.setTitle("Iniciar sesión", for: [])
        signInButton.configuration?.imagePadding = 8
        signInButton.tintColor = appColor
        signInButton.setTitleColor(.black, for: .normal)
        signInButton.addTarget(self, action: #selector(signinTapped), for: .primaryActionTriggered)
        
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.textColor = .systemRed
        errorLabel.numberOfLines = 0
        errorLabel.isHidden = true
        errorLabel.textAlignment = .center
    }
    
    func layout(){
       
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(loginView)
        view.addSubview(resetPasswordButton)
        view.addSubview(signInButton)
        view.addSubview(errorLabel)
        
        
        // Login Constraints
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 2),
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        // ResetPassword Constraints
        NSLayoutConstraint.activate([
            resetPasswordButton.topAnchor.constraint(equalTo: loginView.bottomAnchor, constant: 2),
            resetPasswordButton.widthAnchor.constraint(equalToConstant: 180),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: resetPasswordButton.trailingAnchor, multiplier: 1)
        ])
        
        // Signin Constraints
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: resetPasswordButton.bottomAnchor, multiplier: 1),
            signInButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: signInButton.trailingAnchor, multiplier: 2),
        ])
        
        // ErrorLabel Constraint
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 1),
            errorLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: errorLabel.trailingAnchor, multiplier: 2)
        ])
        
        // Title Constraint
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: -4),
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 4)
        ])
        
        //Subtitle Constraint
        NSLayoutConstraint.activate([
            subtitleLabel.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -16),
            subtitleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalTo: subtitleLabel.trailingAnchor, constant: 4)
        ])
    }
}


extension LoginViewController {
    @objc func signinTapped(sender: UIButton) {
        errorLabel.isHidden = true
        login()
    }
    
    @objc func resetPasswordTapped(sender: UIButton) {
        // Logica Olvidó la contraseña
        print("reset password")
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Usuario ó contraseña no deben ser nulos")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Usuario ó contraseña no pueden ser vacíos")
            return
        }
        
        if username == "123" && password == "123" {
            errorLabel.isHidden = true
            delegate?.didLogin()
        } else {
            configureView(withMessage: "Usuario ó contraseña incorrectos")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorLabel.isHidden = false
        errorLabel.text = message
    }
}

