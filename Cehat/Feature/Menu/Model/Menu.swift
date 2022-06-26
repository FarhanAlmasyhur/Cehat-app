//
//  Menu.swift
//  Cehat
//
//  Created by Muhammad Farhan Almasyhur on 15/06/22.
//

import Foundation


struct Menu: Equatable {
    var id: Int
//    var image: String
    var name: String
    var ingredients: [String]
    var cookStep: [String]
    var nutrients: Nutrients
}

