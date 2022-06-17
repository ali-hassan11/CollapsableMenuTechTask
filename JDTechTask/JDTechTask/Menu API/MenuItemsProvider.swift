//
//  MenuItemsProvider.swift
//  JDTechTask
//
//  Created by Ali Hassan on 17/06/2022.
//

import Foundation

enum MenuItemsProviderError: Error {
    case network
    case invalidData
}

typealias MenuFetchResult = Result<[MenuSection], MenuItemsProviderError>

protocol MenuItemsProviderProtocol {
    func fetchMenuOptions(completion: @escaping (MenuFetchResult) -> Void)
}

struct MenuItemsProvider: MenuItemsProviderProtocol {
    
    func fetchMenuOptions(completion: @escaping (MenuFetchResult) -> Void) {
        
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
