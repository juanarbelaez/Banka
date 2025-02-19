//
//  HeaderView.swift
//  Banka
//
//  Created by Juan Arbelaez on 18/02/25.
//

import Foundation
import UIKit

class HeaderView: UIView {
    
    let titleLabel = UILabel()
    let holaLabel = UILabel()
    let usuarioLabel = UILabel()
    let logoImage = UIImageView()
    let stackView = UIStackView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize{
        return CGSize(width: UIView.noIntrinsicMetric, height: 144)
    }
}

extension HeaderView {
    
    func style(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = appColor
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Banka"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 38)
        titleLabel.textAlignment = .left
       
        holaLabel.translatesAutoresizingMaskIntoConstraints = false
        holaLabel.text = "Hola, "
        holaLabel.textAlignment = .left
        holaLabel.font = UIFont.systemFont(ofSize: 20)
        
     
        usuarioLabel.translatesAutoresizingMaskIntoConstraints = false
        usuarioLabel.text = "Juan Arbeláez"
        usuarioLabel.textAlignment = .left
        usuarioLabel.font = UIFont.boldSystemFont(ofSize: 18)

        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(named: "bank-credit")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .leading
        
    }
    
    func layout() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(holaLabel)
        stackView.addArrangedSubview(usuarioLabel)
        
        addSubview(stackView)
        addSubview(logoImage)
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            logoImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            logoImage.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 30),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            logoImage.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}


