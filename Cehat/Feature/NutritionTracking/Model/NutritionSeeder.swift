//
//  NutritionSeeder.swift
//  Cehat
//
//  Created by William Yulio on 14/06/22.
//

import Foundation


struct NutritionSeeder {
    var arrOfNutritionSeeder : [NutritionStructure] = []
    
    let nutritionType: [NutritionType] = [
        .macro, .micro
    ]
    
//    func seedNutrition() -> [NutritionStructure]{
//        var arrOfNutritionSeeder = [NutritionStructure]()
//
//        arrOfNutritionSeeder.append(NutritionStructure.init(nutritionImage: ["icon-karbo", "icon-protein", "icon-lemak"], categoryNutrition: "Makronutrien", labelNutrition: ["Karbohidrat", "Protein", "Lemak"], percentage: ["68%", "28%", "50%"], detailNutrition: ["68gr dari total 100gr", "8gr dari total 100gr", "50gr dari total 100gr"]))
//
//        arrOfNutritionSeeder.append(NutritionStructure.init(nutritionImage: ["icon-vitamin", "icon-vitamin", "icon-vitamin", "icon-vitamin", "icon-vitamin", "icon-vitamin", "icon-vitamin"], categoryNutrition: "Mikronutrien", labelNutrition: ["Vitamin A", "Vitamin B", "Vitamin C", "Vitamin D", "Vitamin E", "Zat Besi", "Zinc"], percentage: ["68%", "68%", "68%", "68%", "68%", "68%", "68%"], detailNutrition: ["68gr dari total 100gr", "68gr dari total 100gr", "68gr dari total 100gr", "68gr dari total 100gr", "68gr dari total 100gr", "68gr dari total 100gr", "68gr dari total 100gr"]))
//
//        return arrOfNutritionSeeder
//    }
    
    init(){
        let macroNutrition1 = NutritionStructure(nutritionImage:"icon-karbo", labelNutrition: "Karbohidrat", categoryNutrition: .macro, percentage: "68%", detailNutrition: "68gr dari total 100gr")

        let macroNutrition2 = NutritionStructure(nutritionImage:"icon-protein", labelNutrition: "Protein", categoryNutrition: .macro, percentage: "28%", detailNutrition: "28gr dari total 100gr")

        let macroNutrition3 = NutritionStructure(nutritionImage:"icon-lemak", labelNutrition: "Lemak", categoryNutrition: .macro, percentage: "50%", detailNutrition: "50gr dari total 100gr")

        let microNutrition1 = NutritionStructure(nutritionImage:"icon-vitamin", labelNutrition: "Vitamin A", categoryNutrition: .micro, percentage: "68%", detailNutrition: "68gr dari total 100gr")

        let microNutrition2 = NutritionStructure(nutritionImage:"icon-vitamin", labelNutrition: "Vitamin B", categoryNutrition: .micro, percentage: "68%", detailNutrition: "68gr dari total 100gr")

        let microNutrition3 = NutritionStructure(nutritionImage:"icon-vitamin", labelNutrition: "Vitamin C", categoryNutrition: .micro, percentage: "68%", detailNutrition: "68gr dari total 100gr")

        let microNutrition4 = NutritionStructure(nutritionImage:"icon-vitamin", labelNutrition: "Vitamin D", categoryNutrition: .micro, percentage: "68%", detailNutrition: "68gr dari total 100gr")

        let microNutrition5 = NutritionStructure(nutritionImage:"icon-vitamin", labelNutrition: "Vitamin E", categoryNutrition: .micro, percentage: "68%", detailNutrition: "68gr dari total 100gr")

        let microNutrition6 = NutritionStructure(nutritionImage:"icon-vitamin", labelNutrition: "Zinc", categoryNutrition: .micro, percentage: "68%", detailNutrition: "68gr dari total 100gr")

        let microNutrition7 = NutritionStructure(nutritionImage:"icon-vitamin", labelNutrition: "Zat Besi", categoryNutrition: .micro, percentage: "68%", detailNutrition: "68gr dari total 100gr")

        arrOfNutritionSeeder.append(macroNutrition1)
        arrOfNutritionSeeder.append(macroNutrition2)
        arrOfNutritionSeeder.append(macroNutrition3)
        arrOfNutritionSeeder.append(microNutrition1)
        arrOfNutritionSeeder.append(microNutrition2)
        arrOfNutritionSeeder.append(microNutrition3)
        arrOfNutritionSeeder.append(microNutrition4)
        arrOfNutritionSeeder.append(microNutrition5)
        arrOfNutritionSeeder.append(microNutrition6)
        arrOfNutritionSeeder.append(microNutrition7)
    }
    
    
    
}
