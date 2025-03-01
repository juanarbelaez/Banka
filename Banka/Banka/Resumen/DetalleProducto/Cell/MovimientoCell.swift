//
//  MovimientoCell.swift
//  Banka
//
//  Created by Juan Arbelaez on 18/02/25.
//

import Foundation
import UIKit

class MovimientoCell: UITableViewCell{
    
    let fechaMovimientoLabel = UILabel()
    let nombreMovientoLabel = UILabel()
    let montoMovimiento = UILabel()
    
    static let reuseId = "MoviemientoCell"
    static let rowHeight: CGFloat = 60
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MovimientoCell {
    private func setup(){
        fechaMovimientoLabel.translatesAutoresizingMaskIntoConstraints = false
        fechaMovimientoLabel.text = "19 feb 2025"
        fechaMovimientoLabel.textAlignment = .left
        fechaMovimientoLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        nombreMovientoLabel.translatesAutoresizingMaskIntoConstraints = false
        nombreMovientoLabel.text = "Compra XXX"
        nombreMovientoLabel.textAlignment = .left
        nombreMovientoLabel.font = UIFont.systemFont(ofSize: 12)
        
        montoMovimiento.translatesAutoresizingMaskIntoConstraints = false
        montoMovimiento.text = "$ 999.999"
        montoMovimiento.textAlignment = .left
        montoMovimiento.font = UIFont.systemFont(ofSize: 18)
    }
    private func layout() {
        
        contentView.addSubview(fechaMovimientoLabel)
        contentView.addSubview(nombreMovientoLabel)
        contentView.addSubview(montoMovimiento)
        
        NSLayoutConstraint.activate([
            fechaMovimientoLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            fechaMovimientoLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 3),
            nombreMovientoLabel.topAnchor.constraint(equalToSystemSpacingBelow: fechaMovimientoLabel.bottomAnchor, multiplier: 0),
            nombreMovientoLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 3),
            montoMovimiento.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: montoMovimiento.trailingAnchor, multiplier: 3),
        ])
    }
}
