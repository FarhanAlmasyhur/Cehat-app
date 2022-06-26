//
//  CehatTests.swift
//  CehatTests
//
//  Created by Muhammad Farhan Almasyhur on 10/06/22.
//

import XCTest
@testable import Cehat

class CehatHistoryTests: XCTestCase {
    
    let historyManager: MenuHistoryRepository = CoreDataHistoryManager()
    var historyMenu: [String: [Menu]]?
    let menuSeeder = MenuSeeder()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        historyMenu = historyManager.getHistoryMenu()
    }
    
    override func tearDown() async throws {
        historyMenu?.removeAll()
    }

    

    func testAddToFavorite() throws {
        
        let beforeAddCount = historyMenu?.count
        let menu = menuSeeder.menu1
        historyMenu = historyManager.getHistoryMenu()
        let tester: [String: [Menu]] = [Date.getTodaysDate(): [menu]]
        
        let menuAdded = historyManager.addToHistory(idMenu: menu.id)
        
        // check can add to history
        XCTAssertTrue(menuAdded)
        
        // check data count added
        XCTAssert((beforeAddCount ?? 0) + 1 == historyManager.getHistoryMenu()?.count)
        
        // check data is the same
        XCTAssert(tester == historyManager.getHistoryMenu())

    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
