//
//  Micronutrients.swift
//  Cehat
//
//  Created by Muhammad Farhan Almasyhur on 21/06/22.
//

import Foundation

typealias NutrientValue = Double

typealias Nutrients = [NutrientValue]

enum NutrientsType: Int, CaseIterable
{
    case calories = 0
    case carbohydrate = 1
    case protein = 2
    case fat = 3
    case vitaminA = 4
    case vitaminB = 5
    case vitaminC = 6
    case vitaminD = 7
    case vitaminE = 8
    case zinc = 9
    case iron = 10
    
    public static var list: Nutrients { get {
        return [NutrientValue](repeatElement(0, count: NutrientsType.allCases.count))
    }}
    
}

extension Nutrients
{
    subscript (index: NutrientsType) -> NutrientValue
    {
        get
        {
            let indexValue = index.rawValue
            return self[indexValue]
        }
        set
        {
            let indexValue = index.rawValue
            self[indexValue] = newValue
        }
    }
}



struct NutrientsData{
    var nutritionType: NutrientsType
    var nutritionValue: NutrientValue
}
