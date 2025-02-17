//
//  UIViewControllers+Utils.swift
//  Banka
//
//  Created by Juan Arbelaez on 17/02/25.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setTabBarImage (imageName: String, title: String) {
        
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}






