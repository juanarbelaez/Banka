//
//  TransferViewController.swift
//  Banka
//
//  Created by Juan Arbelaez on 19/02/25.
//

import Foundation
import UIKit

class TransferViewController: UIViewController {
    
    let titleLabel = UILabel()
    
    let stackView = UIStackView()
    let productoOrigen = ProductoTransferView(title: "Producto origen")
    let montoTransfer = MontoTransferView()
    let productoDestinoView = ProductoTransferView(title: "Producto destino")
    let transferirButton = UIButton()
    
    let cancelarButton = UIButton()
    
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        style()
        layout()
    }
}

extension TransferViewController {
    func style(){
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Transferencia"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 32)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        
        transferirButton.translatesAutoresizingMaskIntoConstraints = false
        transferirButton.configuration = .filled()
        transferirButton.configuration?.imagePadding = 8
        transferirButton.setTitle("Transferir", for: [])
        transferirButton.tintColor = appColor
        transferirButton.setTitleColor(.black, for: .normal)
        transferirButton.addTarget(self, action: #selector(TransferTapped), for: .primaryActionTriggered)
        
        cancelarButton.translatesAutoresizingMaskIntoConstraints = false
        cancelarButton.configuration = .filled()
        cancelarButton.configuration?.imagePadding = 8
        cancelarButton.setTitle("Cancelar", for: [])
        cancelarButton.tintColor = appColor
        cancelarButton.setTitleColor(.black, for: .normal)
        cancelarButton.addTarget(self, action: #selector(CancelTapped), for: .primaryActionTriggered)
        
        
    }
    func layout(){
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(productoOrigen)
        stackView.addArrangedSubview(montoTransfer)
        stackView.addArrangedSubview(productoDestinoView)
        stackView.addArrangedSubview(transferirButton)
        stackView.addArrangedSubview(cancelarButton)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2)
        ])
        
    }
}

extension TransferViewController {
    
    @objc func TransferTapped(sender: UIButton) {
        print("TransferTapped")
    }
    
    @objc func CancelTapped(sender: UIButton) {
        print("CancelTapped")
    }
}
