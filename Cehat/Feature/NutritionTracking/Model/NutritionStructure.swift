//
//  NutritionStructure.swift
//  Cehat
//
//  Created by William Yulio on 14/06/22.
//

import Foundation

enum NutritionType: String, CaseIterable {
    case macro = "Makronutrien"
    case micro = "Mikronutrien"
}

struct NutritionStructure {

    let nutritionImage:String
    let labelNutrition:String
    let categoryNutrition:NutritionType
    let percentage:String
    let detailNutrition:String

}
