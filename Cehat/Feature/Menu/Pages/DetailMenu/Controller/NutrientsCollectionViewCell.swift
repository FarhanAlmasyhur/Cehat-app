//
//  NutrientsCollectionViewCell.swift
//  ScrollableView
//
//  Created by Muhammad Farhan Almasyhur on 21/06/22.
//

import UIKit

class NutrientsCollectionViewCell: UICollectionViewCell{
    
    @IBOutlet weak var roundView: UIView!
    @IBOutlet weak var totalNutrition: UILabel!
    @IBOutlet weak var nutritionName: UILabel!
    
    func setupCell(with nutrition: NutrientsData){
        nutritionName.text = "\(nutrition.nutritionType)".capitalized
        totalNutrition.text = "\(nutrition.nutritionValue)"
        roundView.circleView()
        
    }
}



