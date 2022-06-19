//
//  File.swift
//  JDTechTask
//
//  Created by Ali Hassan on 17/06/2022.
//

import Foundation

struct SectionChild: Decodable {
    let name: String
    let navigation: Navigation
    
    func transform() -> MenuSectionChild {
      
        return MenuSectionChild(name: name,
                                navigation: navigation.transform())
    }
}
