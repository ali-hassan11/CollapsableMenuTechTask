//
//  Root.swift
//  JDTechTask
//
//  Created by Ali Hassan on 17/06/2022.
//

import Foundation

struct Root: Decodable {
    let sections: [Section]
    
    enum CodingKeys: String, CodingKey {
        case sections = "nav"
    }
}
