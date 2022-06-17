//
//  Service.swift
//  JDTechTask
//
//  Created by Ali Hassan on 17/06/2022.
//

import Foundation

struct Root: Decodable {
    let sections: [NavigationSection]
    
    enum CodingKeys: String, CodingKey {
        case sections = "nav"
    }
}

struct NavigationSection: Decodable {
    let name: String
    let navigation: Navigation
    let children: [NavigationChild]?
    
    func transform() -> MenuSection {
        return MenuSection(title: name, options: children?.map { $0.transform() },
                           navigation: navigation.transform())
    }
}

struct NavigationChild: Decodable {
    let name: String
    let navigation: Navigation
    
    func transform() -> MenuSectionChild {
        return MenuSectionChild(name: name,
                                navigation: navigation.transform())
    }

}

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

enum MenuItemsProviderError: Error {
    case network
    case invalidData
}

protocol MenuItemsProviderProtocol {
    func fetchMenuOptions(completion: @escaping (Result<[MenuSection], MenuItemsProviderError>) -> Void)
}

struct MenuItemsProvider: MenuItemsProviderProtocol {
    
    func fetchMenuOptions(completion: @escaping (Result<[MenuSection], MenuItemsProviderError>) -> Void) {
        
        let urlString = "https://s3-eu-west-1.amazonaws.com/api.meshplatform.com/nav.json"
 
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard error == nil else {
                completion(.failure(.network))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }

            completion(MenuItemsMapper.map(data, response))
        })
        .resume()
    }
}

struct MenuItemsMapper {
    
    static func map(_ data: Data, _ response: URLResponse?) -> Result<[MenuSection], MenuItemsProviderError> {
        guard (response as? HTTPURLResponse)?.statusCode == 200,
              let root =  try? JSONDecoder().decode(Root.self, from: data) else {
            return .failure(.invalidData)
        }
        
        let menuSections = root.sections.map { $0.transform() }
        return .success(menuSections)
    }
    
}
