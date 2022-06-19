//
//  Navigator.swift
//  JDTechTask
//
//  Created by Ali Hassan on 19/06/2022.
//

import UIKit

protocol NavigatorProtocol {
    func navigate(to navigationItem: MenuNavigation)
}

struct MenuNavigator {
    
    let navigationController: UINavigationController
    
    func navigate(to navigationItem: MenuNavigation) {
        
        switch navigationItem.type {
        case .link:
            guard let url = URLBuilder.buildUrl(uri: navigationItem.URI) else { return }
            navigationController.pushViewController(WebsiteViewController(url: url), animated: true)
        case .noLink:
            print("noLink")
        case .category:
            guard let url = URLBuilder.buildUrl(uri: navigationItem.URI) else { return }
            navigationController.pushViewController(WebsiteViewController(url: url), animated: true)
        case .infoPage:
            guard let target = navigationItem.target else { return }
            print("Navigate to target: \(target)")
        case .custom:
            guard let target = navigationItem.target else { return }
            print("Navigate to target: \(target)")
        case .unknown:
            fatalError("Unkown navigation type: Unable to handle")
        }
    }
}
