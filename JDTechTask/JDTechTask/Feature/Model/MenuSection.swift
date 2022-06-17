//
//  MenuSection.swift
//  JDTechTask
//
//  Created by Ali Hassan on 17/06/2022.
//

import Foundation

struct MenuSection {
    let title: String
    let options: [MenuSectionChild]?
    var isOpended: Bool = false
    let navigation: MenuNavigation
}
