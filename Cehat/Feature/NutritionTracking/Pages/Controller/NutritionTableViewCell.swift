//
//  NutritionTableViewCell.swift
//  Cehat
//
//  Created by William Yulio on 13/06/22.
//

import UIKit

class NutritionTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nutritionIconImage: UIImageView!
    @IBOutlet weak var nutritionLabel: UILabel!
    @IBOutlet weak var barProgressPercentage: UILabel!
    @IBOutlet weak var nutritionDescription: UILabel!
   // @IBOutlet weak var nutrientBarProgress: UIProgressView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var contentsView: UIView!
    @IBOutlet weak var nutrientProgBar2: UIProgressView!
    
    var ageChild = 2
    var karboMaks: Double?
    var proteinMaks: Double?
    var lemakMaks: Double?
    var vitAMaks: Double?
    var vitBMaks: Double?
    var vitCMaks: Double?
    var vitDMaks: Double?
    var vitEMaks: Double?
    var zincMaks: Double?
    var ironMaks: Double?
    var selectMenu = [80.0,25.0,10.0]
    
    static func nib() -> UINib{
        return UINib(nibName: "NutritionTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        shadowDecorate()
        // add shadow on cell
        backgroundColor = .clear
        layer.masksToBounds = false
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 20
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height: 8)).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale

        // add corner radius on `contentView`
        contentsView.backgroundColor = .white
        contentsView.layer.cornerRadius = 8
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(nutrition: NutritionStructure?){
        nutritionLabel.text = nutrition?.labelNutrition
        if nutritionLabel.text == "Karbohidrat" {
            if (ageChild >= 1) && (ageChild <= 3) {
                karboMaks = 155.0
                nutritionDescription.text = String(Int(selectMenu[0]))+"gr dari total "+String(155)+"gr"
            }
            else {
                karboMaks = 220.0
                nutritionDescription.text = String(Int(selectMenu[0]))+"gr dari total "+String(220)+"gr"
            }
            barProgressPercentage.text = String(format:"%.1f", 100*selectMenu[0]/karboMaks!)+"%"
            let progress = selectMenu[0]/karboMaks!
            nutrientProgBar2.setProgress(Float(progress), animated: true)
            
            if progress <= 0.25 {
                nutrientProgBar2.progressTintColor = UIColor(hex: 0xE05C23)
            }
            
            else if (progress > 0.25) && (progress <= 0.5) {
                nutrientProgBar2.progressTintColor = UIColor(hex: 0xE88429)
            }
            
            else if (progress > 0.5) && (progress <= 0.75) {
                nutrientProgBar2.progressTintColor = UIColor(hex: 0x91AB4D)
            }
            
            else {
                nutrientProgBar2.progressTintColor = UIColor(hex: 0x507B3E)
            }


        }
        
        else if nutritionLabel.text == "Protein" {
            if (ageChild >= 1) && (ageChild <= 3) {
                proteinMaks = 26.0
                nutritionDescription.text = String(Int(selectMenu[1]))+"gr dari total "+String(26)+"gr"
            }
            else {
                proteinMaks = 35.0
                nutritionDescription.text = String(Int(selectMenu[1]))+"gr dari total "+String(35)+"gr"
            }
            barProgressPercentage.text = String(format:"%.1f", 100*selectMenu[1]/proteinMaks!)+"%"
            let progress = selectMenu[1]/proteinMaks!
            nutrientProgBar2.setProgress(Float(progress), animated: true)
            
            if progress <= 0.25 {
                nutrientProgBar2.progressTintColor = UIColor(hex: 0xE05C23)
            }
            
            else if (progress > 0.25) && (progress <= 0.5) {
                nutrientProgBar2.progressTintColor = UIColor(hex: 0xE88429)
            }
            
            else if (progress > 0.5) && (progress <= 0.75) {
                nutrientProgBar2.progressTintColor = UIColor(hex: 0x91AB4D)
            }
            
            else {
                nutrientProgBar2.progressTintColor = UIColor(hex: 0x507B3E)
            }
            
        }
        
        else if nutritionLabel.text == "Lemak" {
            if (ageChild >= 1) && (ageChild <= 3) {
                lemakMaks = 44.0
                nutritionDescription.text = String(Int(selectMenu[2]))+"gr dari total "+String(44)+"gr"
            }
            else {
                lemakMaks = 62.0
                nutritionDescription.text = String(Int(selectMenu[2]))+" dari total "+String(62)+"gr"
            }
            barProgressPercentage.text = String(format:"%.1f", 100*selectMenu[2]/lemakMaks!)+"%"
            let progress = selectMenu[2]/lemakMaks!
            nutrientProgBar2.setProgress(Float(progress), animated: true)
            
            if progress <= 0.25 {
                nutrientProgBar2.progressTintColor = UIColor(hex: 0xE05C23)
            }
            
            else if (progress > 0.25) && (progress <= 0.5) {
                nutrientProgBar2.progressTintColor = UIColor(hex: 0xE88429)
            }
            
            else if (progress > 0.5) && (progress <= 0.75) {
                nutrientProgBar2.progressTintColor = UIColor(hex: 0x91AB4D)
            }
            
            else {
                nutrientProgBar2.progressTintColor = UIColor(hex: 0x507B3E)
            }
        }
        
        else if nutritionLabel.text == "Vitamin A" {
            if (ageChild >= 1) && (ageChild <= 3) {
                proteinMaks = 26.0
                nutritionDescription.text = String(Int(selectMenu[1]))+"gr dari total "+String(26)+"gr"
            }
            else {
                proteinMaks = 35.0
                nutritionDescription.text = String(Int(selectMenu[1]))+"gr dari total "+String(35)+"gr"
            }
            barProgressPercentage.text = String(format:"%.1f", 100*selectMenu[1]/proteinMaks!)+"%"
        }
        
        else if nutritionLabel.text == "Vitamin B" {
            if (ageChild >= 1) && (ageChild <= 3) {
                lemakMaks = 44.0
                nutritionDescription.text = String(Int(selectMenu[2]))+"gr dari total "+String(44)+"gr"
            }
            else {
                lemakMaks = 62.0
                nutritionDescription.text = String(Int(selectMenu[2]))+" dari total "+String(62)+"gr"
            }
            barProgressPercentage.text = String(format:"%.1f", 100*selectMenu[2]/lemakMaks!)+"%"
        }
        
        else if nutritionLabel.text == "Vitamin C" {
            if (ageChild >= 1) && (ageChild <= 3) {
                proteinMaks = 26.0
                nutritionDescription.text = String(Int(selectMenu[1]))+"gr dari total "+String(26)+"gr"
            }
            else {
                proteinMaks = 35.0
                nutritionDescription.text = String(Int(selectMenu[1]))+"gr dari total "+String(35)+"gr"
            }
            barProgressPercentage.text = String(format:"%.1f", 100*selectMenu[1]/proteinMaks!)+"%"
        }
        
        else if nutritionLabel.text == "Vitamin D" {
            if (ageChild >= 1) && (ageChild <= 3) {
                lemakMaks = 44.0
                nutritionDescription.text = String(Int(selectMenu[2]))+"gr dari total "+String(44)+"gr"
            }
            else {
                lemakMaks = 62.0
                nutritionDescription.text = String(Int(selectMenu[2]))+" dari total "+String(62)+"gr"
            }
            barProgressPercentage.text = String(format:"%.1f", 100*selectMenu[2]/lemakMaks!)+"%"
        }
        
        else if nutritionLabel.text == "Vitamin E" {
            if (ageChild >= 1) && (ageChild <= 3) {
                proteinMaks = 26.0
                nutritionDescription.text = String(Int(selectMenu[1]))+"gr dari total "+String(26)+"gr"
            }
            else {
                proteinMaks = 35.0
                nutritionDescription.text = String(Int(selectMenu[1]))+"gr dari total "+String(35)+"gr"
            }
            barProgressPercentage.text = String(format:"%.1f", 100*selectMenu[1]/proteinMaks!)+"%"
        }
        
        else if nutritionLabel.text == "Zinc" {
            if (ageChild >= 1) && (ageChild <= 3) {
                lemakMaks = 44.0
                nutritionDescription.text = String(Int(selectMenu[2]))+"gr dari total "+String(44)+"gr"
            }
            else {
                lemakMaks = 62.0
                nutritionDescription.text = String(Int(selectMenu[2]))+" dari total "+String(62)+"gr"
            }
            barProgressPercentage.text = String(format:"%.1f", 100*selectMenu[2]/lemakMaks!)+"%"
        }
        
        else if nutritionLabel.text == "Zat Besi" {
            if (ageChild >= 1) && (ageChild <= 3) {
                proteinMaks = 26.0
                nutritionDescription.text = String(Int(selectMenu[1]))+"gr dari total "+String(26)+"gr"
            }
            else {
                proteinMaks = 35.0
                nutritionDescription.text = String(Int(selectMenu[1]))+"gr dari total "+String(35)+"gr"
            }
            barProgressPercentage.text = String(format:"%.1f", 100*selectMenu[1]/proteinMaks!)+"%"
        }
        
    }
    
}

//extension UIProgressView{
//    
//    open override func layoutSubviews() {
//         super.layoutSubviews()
//         let maskLayerPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.frame.height / 2)
//         let maskLayer = CAShapeLayer()
//         maskLayer.frame = self.bounds
//         maskLayer.path = maskLayerPath.cgPath
//         layer.mask = maskLayer
//   }
//}
