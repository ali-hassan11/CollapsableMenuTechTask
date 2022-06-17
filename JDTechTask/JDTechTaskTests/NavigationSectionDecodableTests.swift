//
//  NavigationSectionDecodableTests.swift
//  NavigationSectionDecodableTests
//
//  Created by Ali Hassan on 16/06/2022.
//

import XCTest
@testable import JDTechTask

class NavigationSectionDecodableTests: XCTestCase {

    func testNavigationSectionDecodesCorrectly() throws {
        let decoder = JSONDecoder()
        
        let decodedData = try decoder.decode(NavigationSection.self, from: cannedNavigationSection)
        let firstChild = try XCTUnwrap(decodedData.children?.first)
        let lastChild = try XCTUnwrap(decodedData.children?.last)
        
        XCTAssertEqual(decodedData.name, "Latest Mens")
        XCTAssertEqual(decodedData.navigation.type, "CATEGORY")
        XCTAssertEqual(decodedData.navigation.URI, "/men?facet:new=latest&sort=latest")
        XCTAssertEqual(decodedData.children?.count, 4)
        
        XCTAssertEqual(firstChild.name, "Trainers")
        XCTAssertEqual(lastChild.name, "Boots & Shoes")
        
    }

    var cannedNavigationSection: Data {
        let json = """
        {
            "name": "Latest Mens",
            "navigation": {
                "URI": "/men?facet:new=latest&sort=latest",
                "type": "CATEGORY"
            },
            "children": [
                    {
                      "name": "Trainers",
                      "navigationName": "Trainers",
                      "navigation": {
                        "URI": "/men/mens-footwear/trainers",
                        "type": "CATEGORY",
                        "target": "men/mens-footwear/trainers",
                        "depth": null,
                        "data": null
                      },
                      "styles": []
                    },
                    {
                      "name": "Flip-Flops & Sandals",
                      "navigationName": "Flip-Flops & Sandals",
                      "navigation": {
                        "URI": "/men/mens-footwear/flip-flops-and-sandals",
                        "type": "CATEGORY",
                        "target": "men/mens-footwear/flip-flops-and-sandals",
                        "depth": null,
                        "data": null
                      },
                      "styles": []
                    },
                    {
                      "name": "Canvas & Plimsolls",
                      "navigationName": "Canvas & Plimsolls",
                      "navigation": {
                        "URI": "/men/mens-footwear/canvas-and-plimsolls",
                        "type": "CATEGORY",
                        "target": "men/mens-footwear/canvas-and-plimsolls",
                        "depth": null,
                        "data": null
                      },
                      "styles": []
                    },
                    {
                      "name": "Boots & Shoes",
                      "navigationName": "Boots & Shoes",
                      "navigation": {
                        "URI": "/men/mens-footwear/boots-and-shoes",
                        "type": "CATEGORY",
                        "target": "men/mens-footwear/boots-and-shoes",
                        "depth": null,
                        "data": null
                      },
                      "styles": []
                    }
            ]
        }
        """
        return json.data(using: .utf8) ?? Data()
    }
}
