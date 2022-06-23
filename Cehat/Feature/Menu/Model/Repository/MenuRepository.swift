//
//  MenuRepository.swift
//  Cehat
//
//  Created by Muhammad Farhan Almasyhur on 15/06/22.
//


import Foundation


protocol MenuFavoriteRepository {
    func getFavoriteMenu() -> [Menu]?
    func addToFavorite(menu: Menu) -> Bool
    func deleteFromFavorite(menu: Menu) -> Bool
    func deleteAllFavorite() -> Bool
}

protocol MenuHistoryRepository {
    func getHistoryMenu() -> [String:[Menu]]?
    func addToHistory(menu: Menu) -> Bool
    func deleteFromHistory(menu: Menu) -> Bool
    func deleteAllHistory() -> Bool
}
