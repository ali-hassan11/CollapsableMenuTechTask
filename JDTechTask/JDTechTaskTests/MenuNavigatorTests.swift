//
//  MenuNavigatorTests.swift
//  JDTechTaskTests
//
//  Created by Ali Hassan on 19/06/2022.
//

import XCTest
@testable import JDTechTask

class MenuNavigatorTests: XCTestCase {

    func testLinkIsHandled() {
        let navigationItem = MenuNavigation(type: .link, target: nil, URI: "testURL")
        
        let mockNavigator = MockNavigator()
        mockNavigator.navigate(to: navigationItem)
        
        XCTAssertEqual(mockNavigator.linkHandled, true)
        XCTAssertEqual(mockNavigator.noLinkHandled, false)
        XCTAssertEqual(mockNavigator.categoryHandled, false)
        XCTAssertEqual(mockNavigator.infoPageHandled, false)
        XCTAssertEqual(mockNavigator.customHandled, false)
        XCTAssertEqual(mockNavigator.unknownHandled, false)
    }
    
    func testNoLinkIsHandled() {
        let navigationItem = MenuNavigation(type: .noLink, target: nil, URI: "testURL")
        
        let mockNavigator = MockNavigator()
        mockNavigator.navigate(to: navigationItem)
        
        XCTAssertEqual(mockNavigator.noLinkHandled, true)
        XCTAssertEqual(mockNavigator.linkHandled, false)
        XCTAssertEqual(mockNavigator.categoryHandled, false)
        XCTAssertEqual(mockNavigator.infoPageHandled, false)
        XCTAssertEqual(mockNavigator.customHandled, false)
        XCTAssertEqual(mockNavigator.unknownHandled, false)
    }
    
    func testCategoryIsHandled() {
        let navigationItem = MenuNavigation(type: .category, target: nil, URI: "testURL")
        
        let mockNavigator = MockNavigator()
        mockNavigator.navigate(to: navigationItem)
        
        XCTAssertEqual(mockNavigator.categoryHandled, true)
        XCTAssertEqual(mockNavigator.noLinkHandled, false)
        XCTAssertEqual(mockNavigator.linkHandled, false)
        XCTAssertEqual(mockNavigator.infoPageHandled, false)
        XCTAssertEqual(mockNavigator.customHandled, false)
        XCTAssertEqual(mockNavigator.unknownHandled, false)
    }
    
    func testInfoPageIsHandled() {
        let navigationItem = MenuNavigation(type: .infoPage, target: nil, URI: "testURL")
        
        let mockNavigator = MockNavigator()
        mockNavigator.navigate(to: navigationItem)
        
        XCTAssertEqual(mockNavigator.infoPageHandled, true)
        XCTAssertEqual(mockNavigator.noLinkHandled, false)
        XCTAssertEqual(mockNavigator.categoryHandled, false)
        XCTAssertEqual(mockNavigator.linkHandled, false)
        XCTAssertEqual(mockNavigator.customHandled, false)
        XCTAssertEqual(mockNavigator.unknownHandled, false)
    }
    
    func testCustomIsHandled() {
        let navigationItem = MenuNavigation(type: .custom, target: nil, URI: "testURL")
        
        let mockNavigator = MockNavigator()
        mockNavigator.navigate(to: navigationItem)
        
        XCTAssertEqual(mockNavigator.customHandled, true)
        XCTAssertEqual(mockNavigator.noLinkHandled, false)
        XCTAssertEqual(mockNavigator.categoryHandled, false)
        XCTAssertEqual(mockNavigator.infoPageHandled, false)
        XCTAssertEqual(mockNavigator.linkHandled, false)
        XCTAssertEqual(mockNavigator.unknownHandled, false)
    }
    
    func testUnknownHandled() {
        let navigationItem = MenuNavigation(type: .unknown, target: nil, URI: "testURL")
        
        let mockNavigator = MockNavigator()
        mockNavigator.navigate(to: navigationItem)
        
        XCTAssertEqual(mockNavigator.unknownHandled, true)
        XCTAssertEqual(mockNavigator.noLinkHandled, false)
        XCTAssertEqual(mockNavigator.categoryHandled, false)
        XCTAssertEqual(mockNavigator.infoPageHandled, false)
        XCTAssertEqual(mockNavigator.customHandled, false)
        XCTAssertEqual(mockNavigator.linkHandled, false)
    }

}

class MockNavigator: NavigatorProtocol {
    
    var linkHandled = false
    var noLinkHandled = false
    var categoryHandled = false
    var infoPageHandled = false
    var customHandled = false
    var unknownHandled = false
    
    func navigate(to navigationItem: MenuNavigation) {
        
        switch navigationItem.type {
        case .link:
            self.linkHandled = true
        case .noLink:
            self.noLinkHandled = true
        case .category:
            self.categoryHandled = true
        case .infoPage:
            self.infoPageHandled = true
        case .custom:
            self.customHandled = true
        case .unknown:
            self.unknownHandled = true
        }
    }
}
