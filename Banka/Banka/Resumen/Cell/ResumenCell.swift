//
//  ResumenCell.swift
//  Banka
//
//  Created by Juan Arbelaez on 17/02/25.
//

import Foundation
import Foundation
import UIKit

class ResumenCell: UITableViewCell{
    
    let tipoProducto = UILabel()
    let divider = UIView()
    let numeroProducto = UILabel()
    
    let balanceStackView = UIStackView()
    let balanceLabel = UILabel()
    let valorBalanceLabel = UILabel()
    
    static let reuseId = "ResumenCell"
    static let rowHeight: CGFloat = 112
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ResumenCell {
    private func setup(){
        tipoProducto.translatesAutoresizingMaskIntoConstraints = false
        tipoProducto.text = "Tipo Producto"
        tipoProducto.font = UIFont.preferredFont(forTextStyle: .caption1)
        tipoProducto.adjustsFontForContentSizeCategory = true
        
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = appColor
        
        numeroProducto.translatesAutoresizingMaskIntoConstraints = false
        numeroProducto.text = "1234567890"
        numeroProducto.font = UIFont.preferredFont(forTextStyle: .body)
        numeroProducto.adjustsFontForContentSizeCategory = true
        
        balanceStackView.translatesAutoresizingMaskIntoConstraints = false
        balanceStackView.axis = .vertical
        balanceStackView.spacing = 0
        
        balanceLabel.translatesAutoresizingMaskIntoConstraints = true
        balanceLabel.font = UIFont.preferredFont(forTextStyle: .body)
        balanceLabel.text = "Saldo disponible"
        
        valorBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        valorBalanceLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        valorBalanceLabel.text = "$99.999.999"
    }
    
    private func layout() {
        balanceStackView.addArrangedSubview(balanceLabel)
        balanceStackView.addArrangedSubview(valorBalanceLabel)
        
        contentView.addSubview(tipoProducto)
        contentView.addSubview(divider)
        contentView.addSubview(numeroProducto)
        contentView.addSubview(balanceStackView)
        
        NSLayoutConstraint.activate([
            tipoProducto.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            tipoProducto.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            divider.topAnchor.constraint(equalToSystemSpacingBelow: tipoProducto.bottomAnchor, multiplier: 1),
            divider.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            divider.widthAnchor.constraint(equalToConstant: 60),
            divider.heightAnchor.constraint(equalToConstant: 4),
            numeroProducto.topAnchor.constraint(equalToSystemSpacingBelow: divider.bottomAnchor, multiplier: 2),
            numeroProducto.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: balanceStackView.bottomAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: balanceStackView.trailingAnchor, multiplier: 2)
        ])
    }
}
