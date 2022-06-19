//
//  URLBuilder.swift
//  JDTechTask
//
//  Created by Ali Hassan on 19/06/2022.
//

import Foundation

struct URLBuilder {
    
    static func buildUrl(uri: String?) -> URL? {
        guard let uri = uri else { return nil }
        guard let url = URL(string: "https://www.jdsports.co.uk/\(uri)") else { return nil }
        return url
    }
    
}
