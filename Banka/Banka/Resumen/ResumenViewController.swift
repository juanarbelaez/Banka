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
        let barButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTapped))
        barButtonItem.tintColor = .label
        return barButtonItem
    }()
    
    var tableView = UITableView()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        setup()
    }
}

extension ResumenViewController {
    
    private func setup() {
        
        setupNavigationBar()
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
}

extension ResumenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension ResumenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ResumenCell.reuseId, for: indexPath) as! ResumenCell
        return cell
    }
    
    
}

//MARK: - Actions
extension ResumenViewController {
    @objc func logoutTapped(sender: UIButton) {
        // TODO: Cierre sesión
    }
}
