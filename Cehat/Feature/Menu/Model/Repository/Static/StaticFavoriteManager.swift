//
//  StaticRepository.swift
//  Cehat
//
//  Created by Muhammad Farhan Almasyhur on 22/06/22.
//

import Foundation

class StaticFavoriteManager: MenuFavoriteRepository
{
    
    private var favoriteMenus: [Menu] = []
    private var menuSeeder: MenuSeeder = MenuSeeder()
    
    func getFavoriteMenu() -> [Menu]? {
        return favoriteMenus
    }
    
    func addToFavorite(idMenu: Int) -> Bool {
        guard let favoritedMenu = menuSeeder.getMenuById(idMenu: idMenu) else {return false}
        favoriteMenus.append(favoritedMenu)
        return true
    }
    
    func deleteFromFavorite(idMenu: Int) -> Bool {
        if let index = favoriteMenus.firstIndex(where: {$0.id == idMenu}){
            favoriteMenus.remove(at: index)
            return true
        }
        return false
        
    }
    
    func deleteAllFavorite() -> Bool {
        favoriteMenus.removeAll()
        return true
    }
    
    
}
