//
//  File.swift
//  JDTechTask
//
//  Created by Ali Hassan on 17/06/2022.
//

import Foundation

struct NavigationChild: Decodable {
    let name: String
    let children: [NavigationChild]?
    let navigation: Navigation
    
    func transform() -> MenuSectionChild {
      
        return MenuSectionChild(name: name,
                                options: children?.map { $0.transform() },
                                navigation: navigation.transform())
    }
}
