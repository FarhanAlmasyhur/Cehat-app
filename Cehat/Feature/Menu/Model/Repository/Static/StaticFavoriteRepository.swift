//
//  StaticRepository.swift
//  Cehat
//
//  Created by Muhammad Farhan Almasyhur on 22/06/22.
//

import Foundation

class StaticFavoriteRepository: MenuFavoriteRepository
{
    
    private var favoriteMenus: [Menu] = []
    
    func getFavoriteMenu() -> [Menu]? {
        return favoriteMenus
    }
    
    func addToFavorite(menu: Menu) -> Bool {
        favoriteMenus.append(menu)
        return true
    }
    
    func deleteFromFavorite(menu: Menu) -> Bool {
        if let index = favoriteMenus.firstIndex(where: {$0.name == menu.name}){
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
