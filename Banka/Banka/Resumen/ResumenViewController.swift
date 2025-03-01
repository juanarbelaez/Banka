//
//  ResumenViewController.swift
//  Banka
//
//  Created by Juan Arbelaez on 17/02/25.
//

import Foundation

import UIKit

class ResumenViewController: UIViewController {
    
    let games = ["Pacman",
                 "Space Invaders",
                 "Space Patrol",
    ]
    
    lazy var logoutBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Cerrar sesión", style: .plain, target: self, action: #selector(logoutTapped))
        barButtonItem.tintColor = .label
        return barButtonItem
    }()
    
    let headerView = HeaderView(frame: .zero)
    var tableView = UITableView()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        setup()
    }
}

extension ResumenViewController {
    
    private func setup() {
        
        setupNavigationBar()
        setupHeaderView()
        setupTableView()
    }
    
    private func setupTableView(){
        tableView.backgroundColor = appColor
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ResumenCell.self, forCellReuseIdentifier: ResumenCell.reuseId)
        tableView.tableFooterView = UIView()
        tableView.rowHeight = ResumenCell.rowHeight
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupNavigationBar() {
        
        navigationItem.rightBarButtonItem = logoutBarButtonItem
    }
    
    private func setupHeaderView() {
        var size = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        headerView.frame.size = size
        
        tableView.tableHeaderView = headerView
    }
}

extension ResumenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(DetalleProductoViewController(), animated: true)
    }
}

extension ResumenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ResumenCell.reuseId, for: indexPath) as! ResumenCell
        return cell
    }
    
    
}

//MARK: - Actions
extension ResumenViewController {
    @objc func logoutTapped(sender: UIButton) {
        
        NotificationCenter.default.post(name: .logout, object: nil)
    }
}
