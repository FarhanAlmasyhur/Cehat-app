//
//  NutritionStructure.swift
//  Cehat
//
//  Created by William Yulio on 14/06/22.
//

import Foundation

enum NutritionType: String, CaseIterable {
    case macro = "Macro"
    case micro = "Micro"
}

struct NutritionStructure {

    let nutritionImage:String
    let labelNutrition:String
    let categoryNutrition:NutritionType
    let percentage:String
    let detailNutrition:String

}

//class NutritionStructure {
//    var nutritionImage:[String]
//    var categoryNutrition:String
//    var labelNutrition: [String]
//    var percentage:[String]
//    var detailNutrition:[String]
//
//    init(nutritionImage: [String], categoryNutrition: String, labelNutrition: [String], percentage: [String], detailNutrition: [String]){
//        self.nutritionImage = nutritionImage
//        self.categoryNutrition = categoryNutrition
//        self.labelNutrition = labelNutrition
//        self.percentage = percentage
//        self.detailNutrition = detailNutrition
//        
//    }
//}
