//
//  File.swift
//  JDTechTask
//
//  Created by Ali Hassan on 17/06/2022.
//

import Foundation

struct Navigation: Decodable {
    let type: String
    let search: String?
    let target: String?
    let URI: String?
    
    func transform() -> MenuNavigation {
        return MenuNavigation(type: navigationType(), search: search, target: target, URI: URI)
    }
    
    func navigationType() -> NavigationType {
        switch type {
        case "CATEGORY":
            return .category
        case "LINK":
            return .link
        case "NO_LINK":
            return .noLink
        case "INFO_PAGE":
            return .infoPage
        case "SEARCH":
            return .search
        case "CUSTOM":
            return .custom
        default:
            return .unknown
        }
    }
}
