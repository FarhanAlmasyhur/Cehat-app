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
    @IBOutlet weak var nutrientBarProgress: UIProgressView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var contentsView: UIView!
    
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
