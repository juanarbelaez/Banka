//
//  ProductoTransferView.swift
//  Banka
//
//  Created by Juan Arbelaez on 19/02/25.
//

import Foundation


import Foundation
import UIKit

class ProductoTransferView: UIView {
    
    let titleLabel = UILabel()
    let titleText: String
    let nombreCuenta = UILabel()
    let tipoCuentaLabel = UILabel()
    let divider = UIView()
    let numeroCuentaLabel = UILabel()
    let cambiarCuentaLabel = UILabel()
    let chevronImageView = UIImageView()
    let chevronImage = UIImage(systemName: "chevron.right")?.withTintColor(.black, renderingMode: .alwaysOriginal)
    
    
    
    init( title: String) {
        self.titleText = title
        
        super.init(frame: .zero)
        
        style()
        layout()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize{
        return CGSize(width: 200, height: 144)
    }
}

extension ProductoTransferView {
    
    func style(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .tertiarySystemFill
        layer.cornerRadius = 10
        clipsToBounds = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = titleText
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textAlignment = .left
        
        nombreCuenta.translatesAutoresizingMaskIntoConstraints = false
        nombreCuenta.text = "Pepe"
        nombreCuenta.font = UIFont.preferredFont(forTextStyle: .title3)
        
        if titleText == "Producto origen" {
            nombreCuenta.isHidden = true
        } else {
            nombreCuenta.isHidden = false
        }
        

        tipoCuentaLabel.translatesAutoresizingMaskIntoConstraints = false
        tipoCuentaLabel.text = "Tipo de Cuenta"
        tipoCuentaLabel.font = UIFont.preferredFont(forTextStyle: .body)
        tipoCuentaLabel.textAlignment = .left
        
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = appColor
        
        numeroCuentaLabel.translatesAutoresizingMaskIntoConstraints = false
        numeroCuentaLabel.text = "1234567890"
        numeroCuentaLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        numeroCuentaLabel.textAlignment = .left
        
        cambiarCuentaLabel.translatesAutoresizingMaskIntoConstraints  = false
        cambiarCuentaLabel.text = "Cambiar"
        cambiarCuentaLabel.textAlignment = .left
        cambiarCuentaLabel.font = UIFont.preferredFont(forTextStyle: .body)
        
        chevronImageView.translatesAutoresizingMaskIntoConstraints = false
        chevronImageView.image = chevronImage
        
        
        
    }
    
    func layout() {
        addSubview(titleLabel)
        addSubview(nombreCuenta)
        addSubview(tipoCuentaLabel)
        addSubview(divider)
        addSubview(numeroCuentaLabel)
        addSubview(cambiarCuentaLabel)
        addSubview(chevronImageView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            nombreCuenta.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 0.5),
            nombreCuenta.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            tipoCuentaLabel.topAnchor.constraint(equalToSystemSpacingBelow: nombreCuenta.bottomAnchor, multiplier: 0.5),
            tipoCuentaLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            divider.topAnchor.constraint(equalToSystemSpacingBelow: tipoCuentaLabel.bottomAnchor, multiplier: 1),
            divider.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            divider.heightAnchor.constraint(equalToConstant: 4),
            divider.widthAnchor.constraint(equalToConstant: 80),
            numeroCuentaLabel.topAnchor.constraint(equalToSystemSpacingBelow: divider.bottomAnchor, multiplier: 1),
            numeroCuentaLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            chevronImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: chevronImageView.trailingAnchor, multiplier: 1),
            cambiarCuentaLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            chevronImageView.trailingAnchor.constraint(equalToSystemSpacingAfter: cambiarCuentaLabel.trailingAnchor, multiplier: 2)
        ])
    }
}
