//
//  CoreDataHistoryManager.swift
//  Cehat
//
//  Created by Muhammad Farhan Almasyhur on 25/06/22.
//

import Foundation
import CoreData

class CoreDataHistoryManager: MenuHistoryRepository {
    
    private let coreDataHelper = CoreDataHelper()
    private var historyMenus: [String:[Menu]]? = [:]
    private let menuSeeder = MenuSeeder()
    
    func getHistoryMenu() -> [String : [Menu]]? {
        let context = coreDataHelper.getBackgroundContext()
        let fetchRequest = ManagedHistory.fetchRequest()
        do{
            let managedHistory = try context.fetch(fetchRequest)
            for history in managedHistory {
                historyMenus?.updateValue(menuSeeder.makeMenuArraybyId(idMenus: history.idMenu)!, forKey: history.date!)
            }
        } catch {
            print(error)
        }
        return historyMenus
    }
    
    func addToHistory(idMenu: Int) -> Bool {
        let context = coreDataHelper.getBackgroundContext()
        let history: ManagedHistory!
        var historyArr: [Int] = []
        
        // Get todays Menu
        let fetchRequest = ManagedHistory.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "date=%@", Date.getTodaysDate())
        let results = try? context.fetch(fetchRequest)
        
        // if there is no menu added today, create it
        if results?.count == 0{
            history = ManagedHistory(context: context)
            history.date = Date.getTodaysDate()
        } else {
            history = results?.first
            historyArr = history.idMenu ?? []
        }
        historyArr.append(idMenu)
        history.idMenu = historyArr
        coreDataHelper.saveContext(saveContext: context)
        return true
    }
    
    func deleteFromHistory(idMenu: Int) -> Bool {
        let history: ManagedHistory!
        let context = coreDataHelper.getBackgroundContext()
        
        // Get todays Menu
        let fetchRequest = ManagedHistory.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "date=%@", Date.getTodaysDate())
        let results = try? context.fetch(fetchRequest)
        
        // Remove it from todays menu list
        history = results?.first
        if let index = history.idMenu?.firstIndex(where: {$0 == idMenu}){
            history.idMenu?.remove(at: index)
            coreDataHelper.saveContext(saveContext: context)
            return true
        }
        return false
    }
    
    func deleteAllHistory() -> Bool {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = ManagedHistory.fetchRequest()
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try coreDataHelper.getBackgroundContext().execute(batchDeleteRequest)
            return true
        }catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    
}
