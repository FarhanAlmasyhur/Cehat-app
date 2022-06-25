//
//  MenuRepository.swift
//  Cehat
//
//  Created by Muhammad Farhan Almasyhur on 15/06/22.
//


import Foundation


protocol MenuFavoriteRepository {
    func getFavoriteMenu() -> [Menu]?
    func addToFavorite(idMenu: Int) -> Bool
    func deleteFromFavorite(idMenu: Int) -> Bool
    func deleteAllFavorite() -> Bool
}

protocol MenuHistoryRepository {
    func getHistoryMenu() -> [String:[Menu]]?
    func addToHistory(idMenu: Int) -> Bool
    func deleteFromHistory(idMenu: Int) -> Bool
    func deleteAllHistory() -> Bool
}
