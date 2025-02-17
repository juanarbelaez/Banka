//
//  LoginViewController.swift
//  Banka
//
//  Created by Juan Arbelaez on 17/02/25.
//

import Foundation


import UIKit

class LoginViewController: UIViewController {
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton()
    let errorLabel = UILabel()
    let resetPasswordButton = UIButton()
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        style()
        layout()
    }
}

extension LoginViewController {
    func style(){
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "BanKa"
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
        resetPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 3)
        resetPasswordButton.configuration?.buttonSize = .mini
        
        resetPasswordButton.addTarget(self, action: #selector(resetPasswordTapped), for: .primaryActionTriggered)
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.setTitle("Iniciar sesión", for: [])
        signInButton.configuration?.imagePadding = 8
        signInButton.addTarget(self, action: #selector(signinTapped), for: .primaryActionTriggered)
        
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.textColor = .systemRed
        errorLabel.text = "Error"
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
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
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
            signInButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: signInButton.trailingAnchor, multiplier: 1),
        ])
        
        // ErrorLabel Constraint
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 1),
            errorLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: errorLabel.trailingAnchor, multiplier: 1)
        ])
        
        // Title Constraint
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: -4),
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 2)
        ])
        
        //Subtitle Constraint
        NSLayoutConstraint.activate([
            subtitleLabel.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -16),
            subtitleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalTo: subtitleLabel.trailingAnchor, constant: 2)
        ])
    }
}

// MARK: - Actions

extension LoginViewController {
    @objc func signinTapped(sender: UIButton) {
        // Logica Inicio de sesión
    }
    
    @objc func resetPasswordTapped(sender: UIButton) {
        // Logica Olvidó la contraseña
    }
    

    
}

