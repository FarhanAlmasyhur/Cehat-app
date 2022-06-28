//
//  NutrientsCountCollectionViewCell.swift
//  Cehat
//
//  Created by Muhammad Farhan Almasyhur on 26/06/22.
//

import UIKit

class NutrientsCountCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var roundView: UIView!
    @IBOutlet weak var nutritionName: UILabel!
    @IBOutlet weak var totalNutrition: UILabel!
    @IBOutlet weak var nutritionUnit: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(with nutrition: NutrientsData){
        nutritionName.text = "\(nutrition.nutritionType)".capitalized
        totalNutrition.text = "\(nutrition.nutritionValue)"
        roundView.circleView()
        
    }
    
    func setupUnit(index: Int){
        if index == 0 {
            nutritionUnit.text = "kkal"
        } else if (index > 0 && index <= 3) || index == 10 {
            nutritionUnit.text = "gram"
        } else if index > 3 && index <= 8{
            nutritionUnit.text = "mcg"
        } else if index == 9 {
            nutritionUnit.text = "mg"
        }
    }

}
