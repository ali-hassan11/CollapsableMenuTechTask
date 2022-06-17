//
//  NavigationSection.swift
//  JDTechTask
//
//  Created by Ali Hassan on 17/06/2022.
//

import Foundation

struct NavigationSection: Decodable {
    let name: String
    let navigation: Navigation
    let children: [NavigationChild]?
    
    func transform() -> MenuSection {
        
        return MenuSection(title: name,
                           options: children?.map { $0.transform() },
                           navigation: navigation.transform())
    }
}
