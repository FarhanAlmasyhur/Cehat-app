//
//  MenuManager.swift
//  Cehat
//
//  Created by Muhammad Farhan Almasyhur on 15/06/22.
//

import Foundation

protocol MenuFavoriteManager {
    func getFavoriteMenu() -> [Menu]?
    func addToFavorite(menu: Menu)
    func deleteFromFavorite(menu: Menu) -> Bool
    func deleteAllFavorite()
}

protocol MenuHistoryManager {
    func getHistoryMenu() -> [Menu]?
    func addToHistory(menu: Menu)
    func deleteFromHistory(menu: Menu) -> Bool
    func deleteAllHistory()
}
