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
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var contentsView: UIView!
    @IBOutlet weak var nutrientProgBar2: UIProgressView!
    
    var ageChild =  UserDefaults.standard.integer(forKey: "childAge")

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
    
    
    static func nib() -> UINib{
        return UINib(nibName: "NutritionTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .clear
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
            //viewContainer is the parent of viewContents
            //viewContents contains all the UI which you want to show actually.
            
            self.contentsView.layer.cornerRadius = 20
            self.contentsView.layer.masksToBounds = true
            
            let bezierPath = UIBezierPath.init(roundedRect: self.contentsView.bounds, cornerRadius: 20)
            self.contentsView.layer.shadowPath = bezierPath.cgPath
            self.containerView.layer.masksToBounds = false
            self.containerView.layer.shadowColor = UIColor.black.cgColor
            self.containerView.layer.shadowRadius = 3.0
            self.containerView.layer.shadowOffset = CGSize.init(width: 0.5, height: 3)
            self.containerView.layer.shadowOpacity = 0.3
            
            // sending viewContainer color to the viewContents.
            let backgroundCGColor = self.containerView.backgroundColor?.cgColor
            //You can set your color directly if you want by using below two lines. In my case I'm copying the color.
            self.containerView.backgroundColor = nil
            self.containerView.layer.backgroundColor =  backgroundCGColor
            self.containerView.layer.shouldRasterize = true
            self.containerView.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func setupCell(nutrition: NutritionStructure?, nutritionValue: Double){
        nutritionLabel.text = nutrition?.labelNutrition
        nutrientProgBar2.transform = CGAffineTransform(scaleX: 1, y: 2.5)
        nutrientProgBar2.layer.cornerRadius = 6
        nutrientProgBar2.layer.sublayers![1].cornerRadius = 6
        nutrientProgBar2.subviews[1].clipsToBounds = true
        if nutritionLabel.text == "Karbohidrat" {
            if (ageChild >= 1) && (ageChild <= 3) {
                karboMaks = 215.0
                nutritionDescription.text = String(Int(nutritionValue))+"gr dari total "+String(215)+"gr"
            }
            else {
                karboMaks = 220.0
                nutritionDescription.text = String(Int(nutritionValue))+"gr dari total "+String(220)+"gr"
            }
            let calculateKarbo = Int(100*nutritionValue/karboMaks!)
            barProgressPercentage.text = String(calculateKarbo)+"%"
            
            let progress = nutritionValue/karboMaks!
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
            
            else if (progress > 0.75) && (progress <= 1.25) {
                nutrientProgBar2.progressTintColor = UIColor(hex: 0x507B3E)
            }
            else{
                nutrientProgBar2.progressTintColor = UIColor(hex: 0xE05C23)
            }

        }
                
        else if nutritionLabel.text == "Protein" {
            if (ageChild >= 1) && (ageChild <= 3) {
                proteinMaks = 20.0
                nutritionDescription.text = String(Int(nutritionValue))+"gr dari total "+String(20)+"gr"
            }
            else {
                proteinMaks = 25.0
                nutritionDescription.text = String(Int(nutritionValue))+"gr dari total "+String(25)+"gr"
            }
            let calculateProtein = Int(100*nutritionValue/proteinMaks!)
            barProgressPercentage.text = String(calculateProtein)+"%"
            
            let progress = nutritionValue/proteinMaks!
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
            
            else if (progress > 0.75) && (progress <= 1.25) {
                nutrientProgBar2.progressTintColor = UIColor(hex: 0x507B3E)
            }
            else{
                nutrientProgBar2.progressTintColor = UIColor(hex: 0xE05C23)
            }
            
        }
        
        else if nutritionLabel.text == "Lemak" {
            if (ageChild >= 1) && (ageChild <= 3) {
                lemakMaks = 45.0
                nutritionDescription.text = String(Int(nutritionValue))+"gr dari total "+String(45)+"gr"
            }
            else {
                lemakMaks = 50.0
                nutritionDescription.text = String(Int(nutritionValue))+"gr dari total "+String(50)+"gr"
            }
            let calculateLemak = Int(100*nutritionValue/lemakMaks!)
            barProgressPercentage.text = String(calculateLemak)+"%"
            
            let progress = nutritionValue/lemakMaks!
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
            
            else if (progress > 0.75) && (progress <= 1.25) {
                nutrientProgBar2.progressTintColor = UIColor(hex: 0x507B3E)
            }
            else{
                nutrientProgBar2.progressTintColor = UIColor(hex: 0xE05C23)
            }
        }
       
        else if nutritionLabel.text == "Vitamin A" {
            if (ageChild >= 1) && (ageChild <= 3) {
                vitAMaks = 400.0
                nutritionDescription.text = String(Int(nutritionValue))+"RE dari total "+String(400)+"RE"
            }
            else {
                vitAMaks = 450.0
                nutritionDescription.text = String(Int(nutritionValue))+"RE dari total "+String(450)+"RE"
            }
            let calculateVitA = Int(100*nutritionValue/vitAMaks!)
            barProgressPercentage.text = String(calculateVitA)+"%"
            
            let progress = nutritionValue/vitAMaks!
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
            
            else if (progress > 0.75) && (progress <= 1.25) {
                nutrientProgBar2.progressTintColor = UIColor(hex: 0x507B3E)
            }
            else{
                nutrientProgBar2.progressTintColor = UIColor(hex: 0xE05C23)
            }
        }
      
        else if nutritionLabel.text == "Vitamin B" {
            if (ageChild >= 1) && (ageChild <= 3) {
                vitBMaks = 0.5
                nutritionDescription.text = String(Int(nutritionValue))+"mg dari total "+String(0.5)+"mg"
            }
            else {
                vitBMaks = 0.6
                nutritionDescription.text = String(Int(nutritionValue))+"mg dari total "+String(0.6)+"mg"
            }
            let calculateVitB = Int(100*nutritionValue/vitBMaks!)
            barProgressPercentage.text = String(calculateVitB)+"%"
            
            
            let progress = nutritionValue/vitBMaks!
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
            
            else if (progress > 0.75) && (progress <= 1.25) {
                nutrientProgBar2.progressTintColor = UIColor(hex: 0x507B3E)
            }
            else{
                nutrientProgBar2.progressTintColor = UIColor(hex: 0xE05C23)
            }
        }
        
        else if nutritionLabel.text == "Vitamin C" {
            if (ageChild >= 1) && (ageChild <= 3) {
                vitCMaks = 40.0
                nutritionDescription.text = String(Int(nutritionValue))+"mg dari total "+String(40)+"mg"
            }
            else {
                vitCMaks = 45.0
                nutritionDescription.text = String(Int(nutritionValue))+"mg dari total "+String(45)+"mg"
            }
            let calculateVitC = Int(100*nutritionValue/vitCMaks!)
            barProgressPercentage.text = String(calculateVitC)+"%"
            
            let progress = nutritionValue/vitCMaks!
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
            
            else if (progress > 0.75) && (progress <= 1.25) {
                nutrientProgBar2.progressTintColor = UIColor(hex: 0x507B3E)
            }
            else{
                nutrientProgBar2.progressTintColor = UIColor(hex: 0xE05C23)
            }
        }
        
        else if nutritionLabel.text == "Vitamin D" {
            if (ageChild >= 1) && (ageChild <= 3) {
                vitDMaks = 15.0
                nutritionDescription.text = String(Int(nutritionValue))+"mcg dari total "+String(15)+"mcg"
            }
            else {
                vitDMaks = 15.0
                nutritionDescription.text = String(Int(nutritionValue))+"mcg dari total "+String(15)+"mcg"
            }
            let calculateVitD = Int(100*nutritionValue/vitDMaks!)
            barProgressPercentage.text = String(calculateVitD)+"%"
            
            let progress = nutritionValue/vitDMaks!
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
            
            else if (progress > 0.75) && (progress <= 1.25) {
                nutrientProgBar2.progressTintColor = UIColor(hex: 0x507B3E)
            }
            else{
                nutrientProgBar2.progressTintColor = UIColor(hex: 0xE05C23)
            }
        }
        
        else if nutritionLabel.text == "Vitamin E" {
            if (ageChild >= 1) && (ageChild <= 3) {
                vitEMaks = 6.0
                nutritionDescription.text = String(Int(nutritionValue))+"mcg dari total "+String(6)+"mcg"
            }
            else {
                vitEMaks = 7.0
                nutritionDescription.text = String(Int(nutritionValue))+"mcg dari total "+String(7)+"mcg"
            }
            
            let calculateVitE = Int(100*nutritionValue/vitEMaks!)
            barProgressPercentage.text = String(calculateVitE)+"%"
            
            let progress = nutritionValue/vitEMaks!
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
            
            else if (progress > 0.75) && (progress <= 1.25) {
                nutrientProgBar2.progressTintColor = UIColor(hex: 0x507B3E)
            }
            else{
                nutrientProgBar2.progressTintColor = UIColor(hex: 0xE05C23)
            }
        }
        
        else if nutritionLabel.text == "Zinc" {
            if (ageChild >= 1) && (ageChild <= 3) {
                zincMaks = 3.0
                nutritionDescription.text = String(Int(nutritionValue))+"mg dari total "+String(3)+"mg"
            }
            else {
                zincMaks = 5.0
                nutritionDescription.text = String(Int(nutritionValue))+"mg dari total "+String(5)+"mg"
            }
            
            
            let calculateZinc = Int(100*nutritionValue/zincMaks!)
            barProgressPercentage.text = String(calculateZinc)+"%"
            
            let progress = nutritionValue/zincMaks!
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
            
            else if (progress > 0.75) && (progress <= 1.25) {
                nutrientProgBar2.progressTintColor = UIColor(hex: 0x507B3E)
            }
            else{
                nutrientProgBar2.progressTintColor = UIColor(hex: 0xE05C23)
            }
            
        }
        
        else if nutritionLabel.text == "Zat Besi" {
            if (ageChild >= 1) && (ageChild <= 3) {
                ironMaks = 7.0
                nutritionDescription.text = String(Int(nutritionValue))+"gr dari total "+String(7)+"gr"
            }
            else {
                ironMaks = 10.0
                nutritionDescription.text = String(Int(nutritionValue))+"gr dari total "+String(10)+"gr"
            }
            
            let calculateIron = Int(100*nutritionValue/ironMaks!)
            barProgressPercentage.text = String(calculateIron)+"%"
            
            let progress = nutritionValue/ironMaks!
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
            
            else if (progress > 0.75) && (progress <= 1.25) {
                nutrientProgBar2.progressTintColor = UIColor(hex: 0x507B3E)
            }
            else{
                nutrientProgBar2.progressTintColor = UIColor(hex: 0xE05C23)
            }
                
            
        }
        
    }
    
    
    
}
