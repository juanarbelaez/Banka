//
//  ViewController.swift
//  Banka
//
//  Created by Juan Arbelaez on 17/02/25.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTabBar()
    }
    
    private func setupViews() {
        let resumenVC = ResumenViewController()
        let transferVC = TransferViewController()
        let masVC = MasViewController()
        
        resumenVC.setTabBarImage(imageName: "list.dash.header.rectangle", title: "Resumen")
        transferVC.setTabBarImage(imageName: "arrow.left.arrow.right", title: "Transferir")
        masVC.setTabBarImage(imageName: "ellipsis.circle", title: "Más")
        
        let resumenNC = UINavigationController(rootViewController: resumenVC)
        let transferNC = UINavigationController(rootViewController: transferVC)
        let masNC = UINavigationController(rootViewController: masVC)
        
        resumenNC.navigationBar.barTintColor = appColor
        hideNavigationBarLine(resumenNC.navigationBar)
        
        let tabBarList = [resumenNC, transferNC, masNC]
        
        viewControllers = tabBarList
    }
    
    private func hideNavigationBarLine (_ navigationBar: UINavigationBar) {
        let img = UIImage()
        navigationBar.shadowImage = img
        navigationBar.setBackgroundImage(img, for: .default)
        navigationBar.isTranslucent = false
    }
    
    
    private func setupTabBar() {
        tabBar.tintColor = appColor
        tabBar.isTranslucent = false
    }
    
}


// MARK: - Actions
extension MainViewController {
    @objc func logoutTapped(sender: UIButton) {
        
    }
}

class TransferViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemMint
    }
}

class MasViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemPurple
    }
}
