//
//  CehatTests.swift
//  CehatTests
//
//  Created by Muhammad Farhan Almasyhur on 10/06/22.
//

import XCTest
@testable import Cehat

class CehatHistoryTests: XCTestCase {
    
    let staticHistory = StaticHistoryRepository()
    var favoriteMenu: [String: [Menu]]?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        favoriteMenu = staticHistory.getHistoryMenu()
    }
    
    override func tearDown() async throws {
        favoriteMenu?.removeAll()
    }

    

    func testAddToFavorite() throws {
        
        let beforeAddCount = favoriteMenu?.count
        let menu = Menu(id: 1, name: "tahu", ingredients: ["123"], cookStep: ["123"], nutrients: NutrientsType.list)
        let resultAdd = staticHistory.addToHistory(menu: menu)
        favoriteMenu = staticHistory.getHistoryMenu()
        let tester: [String: [Menu]] = [Date.getTodaysDate(): [menu]]
        print(Date.getTodaysDate())
        // check can add to history
        XCTAssertTrue(resultAdd)
        
        // check data count added
        XCTAssert((beforeAddCount ?? 0) + 1 == favoriteMenu?.count)
        
        // check data is the same
        XCTAssert((favoriteMenu![Date.getTodaysDate()]) == tester[Date.getTodaysDate()])

        
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
