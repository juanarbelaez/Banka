//
//  DetalleProductoViewController.swift
//  Banka
//
//  Created by Juan Arbelaez on 18/02/25.
//

import Foundation
import UIKit

class DetalleProductoViewController: UIViewController {
    
    
    var tableView = UITableView()
    let headerView = HeaderViewProducto()
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        setup()
    }
}

extension DetalleProductoViewController {
    
    private func setup() {
        setupTableView()
        setupHeaderView()
    }
    
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MovimientoCell.self, forCellReuseIdentifier: MovimientoCell.reuseId)
        tableView.rowHeight = MovimientoCell.rowHeight
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupHeaderView() {
        var size = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        headerView.frame.size = size
        
        tableView.tableHeaderView = headerView
    }
}

extension DetalleProductoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension DetalleProductoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovimientoCell.reuseId, for: indexPath) as! MovimientoCell
        return cell
    }
    
    
}
