//
//  Service.swift
//  JDTechTask
//
//  Created by Ali Hassan on 17/06/2022.
//

import Foundation

struct MenuItemsMapper {
    
    static func map(_ data: Data, _ response: URLResponse?) -> MenuFetchResult {
        guard (response as? HTTPURLResponse)?.statusCode == 200,
              let root =  try? JSONDecoder().decode(Root.self, from: data) else {
            return .failure(.invalidData)
        }
        
        let menuSections = root.sections.map { $0.transform() }
        return .success(menuSections)
    }
}
