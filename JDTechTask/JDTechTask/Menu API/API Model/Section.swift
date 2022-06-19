//
//  NavigationSection.swift
//  JDTechTask
//
//  Created by Ali Hassan on 17/06/2022.
//

import Foundation

struct Section: Decodable {
    let name: String
    let navigation: Navigation
    let children: [SectionChild]?
    
    func transform() -> MenuSection {
        
        return MenuSection(title: name,
                           options: children?.map { $0.transform() },
                           navigation: navigation.transform())
    }
}
