//
//  StaticHistoryRepository.swift
//  Cehat
//
//  Created by Muhammad Farhan Almasyhur on 22/06/22.
//

import Foundation

class StaticHistoryRepository: MenuHistoryRepository
{
    private var historyMenus: [String: [Menu]] = [:]
    private let todaysDate: String = Date.getTodaysDate()
    
    
    
    func getHistoryMenu() -> [String:[Menu]]? {
        return historyMenus
    }
    
    func addToHistory(menu: Menu) -> Bool {
        guard var historyMenuArray: [Menu] = historyMenus[todaysDate] else
        {
            historyMenus.updateValue([menu], forKey: todaysDate)
            return true
        }
        historyMenuArray.append(menu)
        historyMenus.updateValue(historyMenuArray, forKey: todaysDate)
        return true
    }
    
    func deleteFromHistory(menu: Menu) -> Bool {
        var historyMenuArray: [Menu]? = historyMenus[todaysDate]
        guard let index = historyMenuArray?.firstIndex(where: {$0.name == menu.name}) else { return false }
        historyMenuArray?.remove(at: index)
        historyMenus.updateValue(historyMenuArray ?? [], forKey: todaysDate)
        return true
    }
    
    func deleteAllHistory() -> Bool {
        historyMenus.removeAll()
        return true
    }
    
    
    
}
