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

struct MenuNavigator: NavigatorProtocol {
    
    let navigationController: UINavigationController
    
    func navigate(to navigationItem: MenuNavigation) {
        
        switch navigationItem.type {
        case .link:
            pushWebPage(uri: navigationItem.URI)
        case .category:
            pushWebPage(uri: navigationItem.URI)
        case .search:
            pushWebPage(uri: navigationItem.URI)
        case .noLink:
            print("No link")
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
    
    private func pushWebPage(uri: String?) {
        guard let url = URLBuilder.buildUrl(uri: uri) else { return }
        navigationController.pushViewController(WebsiteViewController(url: url), animated: true)
    }
}
