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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(with nutrition: NutrientsData){
        nutritionName.text = "\(nutrition.nutritionType)".capitalized
        totalNutrition.text = "\(nutrition.nutritionValue)"
        roundView.circleView()
        
    }

}
