//
//  MasViewController.swift
//  Banka
//
//  Created by Juan Arbelaez on 21/02/25.
//

import Foundation
import UIKit

struct Servicio {
    let ImageName: String
    let nombreServicio: String
}


class MasViewController: UIViewController {
    
    let stackView = UIStackView()
    
    let titleLabel = UILabel()
    
    let infoUsuarioView = UIView()
    let usuarioLabel = UILabel()
    let infoSesion = UILabel()
    
    let serviciosCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    let servicios = [Servicio(ImageName: "person", nombreServicio: "Tu usuario"),Servicio(ImageName: "lock", nombreServicio: "Bloqueos"),Servicio(ImageName: "checkmark.shield", nombreServicio: "Seguridad"),Servicio(ImageName: "creditcard", nombreServicio: "Tarjetas"), Servicio(ImageName: "envelope", nombreServicio: "Mensajes"),Servicio(ImageName: "location.square", nombreServicio: "Visítanos")]
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        serviciosCollectionView.dataSource = self
        serviciosCollectionView.delegate = self
        
        style()
        layout()
    }
}

extension MasViewController {
    func style(){
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 30
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Servicios"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 32)
        
        infoUsuarioView.translatesAutoresizingMaskIntoConstraints = false
        infoUsuarioView.layer.cornerRadius = 10
        infoUsuarioView.clipsToBounds = true
        infoUsuarioView.backgroundColor = appColor
        
        usuarioLabel.translatesAutoresizingMaskIntoConstraints = false
        usuarioLabel.text = "Juan Pablo Arbeláez López"
        usuarioLabel.font = UIFont.boldSystemFont(ofSize: 18)
        usuarioLabel.textAlignment = .center
        
        infoSesion.translatesAutoresizingMaskIntoConstraints = false
        infoSesion.text = "Último ingreso: 25 feb 2025 - 10:39 p.m."
        infoSesion.textAlignment = .center
        infoSesion.font = UIFont.systemFont(ofSize: 10)
        
        serviciosCollectionView.translatesAutoresizingMaskIntoConstraints = false
        serviciosCollectionView.register(ServicioCell.self, forCellWithReuseIdentifier: ServicioCell.reuseId)
        
    }
    func layout(){
        
        infoUsuarioView.addSubview(usuarioLabel)
        infoUsuarioView.addSubview(infoSesion)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(infoUsuarioView)
    
        view.addSubview(stackView)
        view.addSubview(serviciosCollectionView)
        
        
        //UsuarioView Constraints
        NSLayoutConstraint.activate([
            usuarioLabel.topAnchor.constraint(equalToSystemSpacingBelow: infoUsuarioView.topAnchor, multiplier: 1),
            usuarioLabel.centerXAnchor.constraint(equalTo: infoUsuarioView.centerXAnchor),
            infoSesion.topAnchor.constraint(equalToSystemSpacingBelow: usuarioLabel.bottomAnchor, multiplier: 0),
            infoSesion.centerXAnchor.constraint(equalTo: infoUsuarioView.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 8),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
            infoUsuarioView.heightAnchor.constraint(equalToConstant: 64)
        ])
        

        NSLayoutConstraint.activate([
            serviciosCollectionView.topAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 4),
            serviciosCollectionView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: serviciosCollectionView.trailingAnchor, multiplier: 4),
            serviciosCollectionView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
}
    
extension MasViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = serviciosCollectionView.dequeueReusableCell(withReuseIdentifier: ServicioCell.reuseId, for: indexPath) as! ServicioCell
        cell.configureCell(imageName: servicios[indexPath.row].ImageName, servicio: servicios[indexPath.row].nombreServicio)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return servicios.count
    }
}

extension MasViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.size.width / 3.0) - 16.0 , height: 80)
    }
}
