//
//  HeaderViewProducto.swift
//  Banka
//
//  Created by Juan Arbelaez on 18/02/25.
//

import Foundation
import UIKit

class HeaderViewProducto: UIView {
    
    let tipoProducto = UILabel()
    let divider = UIView()
    let numeroProducto = UILabel()
    
    let balanceStackView = UIStackView()
    let balanceLabel = UILabel()
    let valorBalanceLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    override var intrinsicContentSize: CGSize{
        return CGSize(width: UIView.noIntrinsicMetric, height: 112)
    }
}

extension HeaderViewProducto {
    
    func style(){
        translatesAutoresizingMaskIntoConstraints = false
        
        tipoProducto.translatesAutoresizingMaskIntoConstraints = false
        tipoProducto.text = "Tipo Producto"
        tipoProducto.font = UIFont.preferredFont(forTextStyle: .title1)
        tipoProducto.adjustsFontForContentSizeCategory = true
        
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = appColor
        
        numeroProducto.translatesAutoresizingMaskIntoConstraints = false
        numeroProducto.text = "1234567890"
        numeroProducto.font = UIFont.preferredFont(forTextStyle: .title3)
        numeroProducto.adjustsFontForContentSizeCategory = true
        
        balanceStackView.translatesAutoresizingMaskIntoConstraints = false
        balanceStackView.axis = .vertical
        balanceStackView.spacing = 0
        
        balanceLabel.translatesAutoresizingMaskIntoConstraints = true
        balanceLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        balanceLabel.text = "Saldo disponible"
        
        valorBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        valorBalanceLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        valorBalanceLabel.text = "$99.999.999"
        
        
    }
    
    func layout() {

        balanceStackView.addArrangedSubview(balanceLabel)
        balanceStackView.addArrangedSubview(valorBalanceLabel)
        
        addSubview(tipoProducto)
        addSubview(divider)
        addSubview(numeroProducto)
        addSubview(balanceStackView)
        
        
        NSLayoutConstraint.activate([
            tipoProducto.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            tipoProducto.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            divider.topAnchor.constraint(equalToSystemSpacingBelow: tipoProducto.bottomAnchor, multiplier: 0),
            divider.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            divider.widthAnchor.constraint(equalToConstant: 160),
            divider.heightAnchor.constraint(equalToConstant: 4),
            numeroProducto.topAnchor.constraint(equalToSystemSpacingBelow: divider.bottomAnchor, multiplier: 1),
            numeroProducto.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: balanceStackView.bottomAnchor, multiplier: 4),
            balanceStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 32)
           
        ])
    }
}
