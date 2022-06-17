//
//  NavigationChildDecodableTests.swift
//  NavigationChildDecodableTests
//
//  Created by Ali Hassan on 16/06/2022.
//

import XCTest
@testable import JDTechTask

class NavigationChildDecodableTests: XCTestCase {

    func testNavigationChildDecodesCorrectly() throws {
        let decoder = JSONDecoder()
        
        let decodedData = try decoder.decode(NavigationChild.self, from: cannedNavigationChild)
        
        XCTAssertEqual(decodedData.name, "Latest Mens")
        XCTAssertEqual(decodedData.navigation.type, "CATEGORY")
        XCTAssertEqual(decodedData.navigation.URI, "/men?facet:new=latest&sort=latest")
    }

    var cannedNavigationChild: Data {
        let json = """
        {
            "name": "Latest Mens",
            "navigation": {
                "URI": "/men?facet:new=latest&sort=latest",
                "type": "CATEGORY"
                }
        }
        """
        return json.data(using: .utf8) ?? Data()
    }
}


