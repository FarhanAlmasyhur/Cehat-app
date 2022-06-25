//
//  CoreDataFavoriteManager.swift
//  Cehat
//
//  Created by Muhammad Farhan Almasyhur on 25/06/22.
//

import Foundation
import CoreData


class CoreDataFavoriteManager: MenuFavoriteRepository{
    
    private let coreDataHelper = CoreDataHelper()
    private var favoriteMenus: [Menu]? = []
    private let menuSeeder = MenuSeeder()
    
    func getFavoriteMenu() -> [Menu]? {
        let context = coreDataHelper.getBackgroundContext()
        let fetchRequest = ManagedFavorite.fetchRequest()
        do{
            let managedFavorite = try context.fetch(fetchRequest)
            let idMenus: [Int]? = managedFavorite.map{Int($0.idMenu)}
            favoriteMenus = idMenus?.map{menuSeeder.getMenuById(idMenu: $0)} as? [Menu]
            return favoriteMenus
        } catch {
            print(error)
        }
        return []
        
    }
    
    func addToFavorite(idMenu: Int) -> Bool {
        let context = coreDataHelper.getBackgroundContext()
        let favorite = ManagedFavorite(context: context)
        favorite.idMenu = Int32(idMenu)
        coreDataHelper.saveContext(saveContext: context)
        return true
    }
    
    func deleteFromFavorite(idMenu: Int) -> Bool {
        let context = coreDataHelper.getBackgroundContext()
        let managedFavorite = ManagedFavorite(context: context)
        managedFavorite.idMenu = Int32(idMenu)
        context.delete(managedFavorite)
        do {
            try context.save()
            return true
        } catch {
            print(error)
            return false
        }
    }
    
    func deleteAllFavorite() -> Bool {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = ManagedFavorite.fetchRequest()
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
