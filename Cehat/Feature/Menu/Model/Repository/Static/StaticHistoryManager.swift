//
//  StaticHistoryRepository.swift
//  Cehat
//
//  Created by Muhammad Farhan Almasyhur on 22/06/22.
//

import Foundation

class StaticHistoryManager: MenuHistoryRepository
{
    private var historyMenus: [String: [Menu]] = [:]
    private let todaysDate: String = Date.getTodaysDate()
    private let menuSeeder: MenuSeeder = MenuSeeder()
    
    func getHistoryMenu() -> [String:[Menu]]? {
        return historyMenus
    }
    
    func addToHistory(idMenu: Int) -> Bool {
        guard let menuAdded = menuSeeder.getMenuById(idMenu: idMenu) else { return false }
        historyMenus[todaysDate]?.append(menuAdded)
        return true
    }
    
    func deleteFromHistory(idMenu: Int) -> Bool {
        if let index = historyMenus[todaysDate]?.firstIndex(where: {$0.id == idMenu}){
            historyMenus[todaysDate]?.remove(at: index)
            return true
        }
        return false
    }
    
    func deleteAllHistory() -> Bool {
        historyMenus.removeAll()
        return true
    }
    
    
    
}
