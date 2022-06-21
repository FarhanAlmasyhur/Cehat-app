//
//  NutritionTableViewCell + Extension UITableViewCell.swift
//  Cehat
//
//  Created by William Yulio on 20/06/22.
//

import UIKit

extension NutritionTableViewCell {
    func shadowDecorate() {
        let radius: CGFloat = 15
        contentView.layer.cornerRadius = radius
        contentView.layer.borderWidth = 3
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
    
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.3
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height: 8)).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        layer.cornerRadius = radius
    }
}
