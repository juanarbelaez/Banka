//
//  ServicioCell.swift
//  Banka
//
//  Created by Juan Arbelaez on 21/02/25.
//

import Foundation
import UIKit


class ServicioCell: UICollectionViewCell {
    
    let imageViewCell = UIImageView()
    let servicioLabel = UILabel()
    
    static let reuseId = "ServicioCell"

    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ServicioCell {
    
    private func setup() {

        imageViewCell.translatesAutoresizingMaskIntoConstraints = false
        imageViewCell.layer.cornerRadius = 25
        imageViewCell.clipsToBounds = true
        imageViewCell.backgroundColor = appColor
    
        
        servicioLabel.translatesAutoresizingMaskIntoConstraints = false
        servicioLabel.textAlignment = .center
//        servicioLabel.adjustsFontForContentSizeCategory = true
        servicioLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        
        
    }
    
    private func layout() {
        
        contentView.addSubview(imageViewCell)
        contentView.addSubview(servicioLabel)
        
        
        NSLayoutConstraint.activate([
            imageViewCell.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            imageViewCell.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageViewCell.heightAnchor.constraint(equalToConstant: 50),
            imageViewCell.widthAnchor.constraint(equalToConstant: 50),
            servicioLabel.topAnchor.constraint(equalToSystemSpacingBelow: imageViewCell.bottomAnchor, multiplier: 1),
            servicioLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func configureCell(imageName: String, servicio: String) {
        
        if let image = UIImage(systemName: imageName)?.withTintColor(.black, renderingMode: .alwaysOriginal){
            image.withAlignmentRectInsets(UIEdgeInsets(top: -1, left: -1, bottom: -1, right: -1))
            imageViewCell.contentMode = .center
            imageViewCell.image = image
//
        } else {
            print("ErrorImage")
        }
        servicioLabel.text = servicio
    }
}
