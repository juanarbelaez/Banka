//
//  MontoTransferView.swift
//  Banka
//
//  Created by Juan Arbelaez on 20/02/25.
//

import Foundation

import Foundation
import UIKit

class MontoTransferView: UIView {
    
    let titleLabel = UILabel()
    let montoLabel = UILabel()
    let cambiarMontoLabel = UILabel()
    let chevronImageView = UIImageView()
    let chevronImage = UIImage(systemName: "chevron.right")?.withTintColor(.black, renderingMode: .alwaysOriginal)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize{
        return CGSize(width: 200, height: 64)
    }
}

extension MontoTransferView {
    
    func style(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .tertiarySystemFill
        layer.cornerRadius = 10
        clipsToBounds = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Valor a enviar"
        
        montoLabel.translatesAutoresizingMaskIntoConstraints = false
        montoLabel.text = "$0"
        
        cambiarMontoLabel.translatesAutoresizingMaskIntoConstraints = false
        cambiarMontoLabel.text = "Cambiar"
        
        chevronImageView.translatesAutoresizingMaskIntoConstraints = false
        chevronImageView.image = chevronImage
        
    }
    
    func layout() {
        
        addSubview(titleLabel)
        addSubview(montoLabel)
        addSubview(cambiarMontoLabel)
        addSubview(chevronImageView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            montoLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 1),
            montoLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            chevronImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: chevronImageView.trailingAnchor, multiplier: 1),
            cambiarMontoLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            chevronImageView.trailingAnchor.constraint(equalToSystemSpacingAfter: cambiarMontoLabel.trailingAnchor, multiplier: 2)
        ])
//
//        chevronImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
//        trailingAnchor.constraint(equalToSystemSpacingAfter: chevronImageView.trailingAnchor, multiplier: 1),
//        cambiarCuentaLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
//        chevronImageView.trailingAnchor.constraint(equalToSystemSpacingAfter: cambiarCuentaLabel.trailingAnchor, multiplier: 2)
        
        
        
    }
}
