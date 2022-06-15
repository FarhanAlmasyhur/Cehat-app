//
//  StaticDataStore.swift
//  Cehat
//
//  Created by Muhammad Farhan Almasyhur on 15/06/22.
//

import Foundation


class StaticFavoriteDataStore: MenuFavoriteManager {
    
    
    private var favoriteMenus: [Menu] = [
        Menu(name: "Bakso Sayur", ingredients: "200gr Brokoli\n50gr Santan\n20gr Micin", cookStep: "Gabungkan semua bahan", age: "0-1 Tahun", calories: 200, carbohydrate: 100, protein: 100, fat: 100, vitaminA: 50, vitaminB: 50, vitaminC: 50, vitaminD: 50, vitaminE: 30, zinc: 20, iron: 10),
        Menu(name: "Bakso Ayam", ingredients: "100gr Daging Ayam\n50gr boraks\n20gr Micin", cookStep: "Gabungkan semua bahan", age: "2-5 Tahun", calories: 100, carbohydrate: 500, protein: 300, fat: 1200, vitaminA: 50, vitaminB: 50, vitaminC: 50, vitaminD: 50, vitaminE: 30, zinc: 20, iron: 10)
    ]
    
    func getFavoriteMenu() -> [Menu]? {
        return favoriteMenus
    }
    
    func addToFavorite(menu: Menu) {
        favoriteMenus.append(menu)
    }
    
    func deleteFromFavorite(menu: Menu) -> Bool {
        if let index = favoriteMenus.firstIndex(where: {$0.name == menu.name}){
            favoriteMenus.remove(at: index)
            return true
        }
        return false
        
    }
    
    func deleteAllFavorite() {
        favoriteMenus.removeAll()
    }
    
    
}
