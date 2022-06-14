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
    @IBOutlet weak var barProgressNutrition: UIProgressView!
    @IBOutlet weak var barProgressPercentage: UILabel!
    @IBOutlet weak var nutritionDescription: UILabel!
    
    
    static func nib() -> UINib{
        return UINib(nibName: "NutritionTableViewCell", bundle: nil)
    }
    
    public func configure(with imageName: String){
        nutritionIconImage.image = UIImage(named: imageName)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
