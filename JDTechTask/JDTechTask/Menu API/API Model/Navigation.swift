//
//  File.swift
//  JDTechTask
//
//  Created by Ali Hassan on 17/06/2022.
//

import Foundation

struct Navigation: Decodable {
    let URI: String?
    let type: String
    
    func transform() -> MenuNavigation {
        return MenuNavigation(type: self.navigationType(), URI: URI)
    }
    
    func navigationType() -> NavigationType {
        switch type {
        case "category":
            return .category
        case "link":
            return .link
        case "noLink":
            return .noLink
        case "infoPage":
            return .infoPage
        case "custom":
            return .custom
        default:
            return .unknown
        }
    }
}
